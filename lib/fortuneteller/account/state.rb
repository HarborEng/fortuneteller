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
        @daily_growth_rate = 1.05**(1.0 / 365) # 5% annum
      end

      def initialize_copy(orig)
        super
        @balances = orig.balances.dup
      end

      def balance
        @balances.values.map(&:to_i).sum # TODO: remove me?
      end

      def credit(amount:, holding:, on:)
        pass_time(to: on)
        @balances[holding] += amount
      end

      def debit(amount:, holding: :cash, on:, pass_time: true)
        pass_time(to: on) if pass_time
        @balances[holding] -= amount

        if @balances[holding] < 0 # waterfall debit across other accounts
          @balances.sort_by(&:last).each do |other_holding, balance|
            next if holding == other_holding

            if -@balances[holding] <= balance
              @balances[other_holding] += @balances[holding]
              @balances[holding] = 0
            else
              @balances[holding] += @balances[other_holding]
              @balances[other_holding] = 0
            end
          end
        end
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