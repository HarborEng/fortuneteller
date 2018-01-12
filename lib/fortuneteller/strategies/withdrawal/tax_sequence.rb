module FortuneTeller::Strategies
  module Withdrawal
    class TaxSequence
      def withdraw!(sim:, accounts:, amount:, date:)
        withdrawn = 0

        sequence.each do |k|
          bal = sim.balance(key: k)

          next if bal.zero?
          sim.pass_time_account!(key: k, to: date)
          
          account_amount = [sim.balance(key: k), (amount - withdrawn)].min
          # next if account_amount.zero?

          sim.debit_account(key: k, amount: account_amount, date: date, pass_time: false)
          withdrawn += account_amount
          break if withdrawn == amount
        end         
      end

      private

      def sequence(accounts)
        @sequence ||= begin
          type_map = accounts.transform_values do |a| 
            SEQUENCE_MAP[FortuneTeller::Account::Component::TAX_MAP[a[:type]]]
          end
          type_map
            .each_pair
            .sort do |x, y|
              a = (x[1] <=> y[1])
              (a==0 ? x[0] <=> y[0] : a)
            end
            .map{|x| x[0]}
        end
      end

      SEQUENCE_MAP = {
        :after_tax              => 0,
        :roth_retirement        => 1,
        :traditional_retirement => 2,
      }
    end
  end
end
