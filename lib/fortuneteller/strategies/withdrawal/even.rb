module FortuneTeller::Strategies
  module Withdrawal
    class Even
      def withdraw!(sim:, accounts:, amount:, date:)
        withdrawn = 0

        sim.pass_time_all!(to: date)

        total_balances = accounts.keys.map{ |k| [k, sim.balance(key: k)] }.to_h
        cumulative = total_balances.values.sum

        withdrawals = total_balances.transform_values {|a| (amount.to_f*a/cumulative).round }

        diff = amount - withdrawals.values.sum
        if diff != 0
          withdrawals[withdrawals.keys.last] += diff
        end

        withdrawals.each {|k,a| sim.debit_account(key: k, amount: a, date: date, pass_time: false) }
      end
    end
  end
end