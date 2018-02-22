module FortuneTeller::Strategies
  module Debit
    class Proportional < FortuneTeller::Strategies::Debit::Base
      def debit!(sim:, accounts:, amount:, date:, cashflow:, tax_calculator:)
        proportional_debit(
          debit_keys: sim.account_keys, 
          accounts: accounts, 
          amount: amount, 
          date: date, 
          sim: sim,
          cashflow: cashflow
        )
      end
    end
  end
end