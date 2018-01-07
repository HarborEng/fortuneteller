module FortuneTeller
  module Account
    class State
      attr_accessor :balances, :date
      attr_reader :account_ref, :growth_rates
      def initialize(start_date:, balances:, account_ref:, growth_rates:)
        @account_ref = account_ref
        @date = start_date
        @balances = balances
        @growth_rates = growth_rates
      end

      def initialize_copy(orig)
        super
        @balances = orig.balances.dup
      end

      def balance
        @balances.values.map(&:to_i).sum
      end

      def credit(amount:, holding:, on:)
        pass_time(to: on)
        @balances[holding] += amount
      end

      def debit(amount:, holding: :cash, on:, pass_time: true)
        pass_time(to: on) if pass_time

        before_balance = balance

        if(before_balance <= amount)
          @balances.transform_values! { |a| 0 }
        else
          # Even withdrawal
          @balances.transform_values! { |a| (a - ((a.to_f/before_balance)*amount).round) }

          #maybe we should ignore the rounding errors
          after_balance = balance
          diff = (before_balance - amount - after_balance)
          if diff != 0
            @balances[@balances.keys.first] += diff
          end
        end

        # @balances[holding] -= amount

        # if @balances[holding] < 0 # waterfall debit across other accounts
        #   @balances.sort_by(&:last).each do |other_holding, balance|
        #     next if holding == other_holding

        #     if -@balances[holding] <= balance
        #       @balances[other_holding] += @balances[holding]
        #       @balances[holding] = 0
        #     else
        #       @balances[holding] += @balances[other_holding]
        #       @balances[other_holding] = 0
        #     end
        #   end
        # end
      end

      def pass_time(to:)
        days = (to - @date).to_i
        @balances.each do |holding, balance|
          next if balance < 0

          rate = growth_rates.daily(holding, @date.year)
          @balances[holding] = (balance * (rate**days)).round
        end
        @date = to
      end

      def as_json(_options = nil)
        balance
      end
    end
  end
end