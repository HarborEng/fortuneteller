require 'test_helper'

class WithdrawalStrategyTest < MiniTest::Test
  # class FakeSim
  #   attr_reader :debits
  #   def initialize
  #     @debits = []
  #   end

  #   def pass_time_account!(*); end

  #   def debit_account!(key:, amount:, **)
  #     @debits << [key, amount]
  #   end
  # end

  # def test_proportional
  #   sim = FakeSim.new
  #   strategy = FortuneTeller::Strategies::Debit::Proportional.new

  #   accounts = {
  #     "AA" => { total_balance: 3, balances: { stocks: 3 } },
  #     "AB" => { total_balance: 3, balances: { stocks: 3 } },
  #   }

  #   strategy.send(:proportional_debit,
  #     debit_keys: ["AA", "AB"],
  #     accounts: accounts,
  #     amount: 5,
  #     date: Date.today,
  #     sim: sim
  #   )

  #   assert_equal [["AA", 3], ["AB", 2]], sim.debits
  # end

  # def test_tax_sequence
  #   strategy = FortuneTeller::Strategies::Debit::TaxSequence.new
  #   accounts = {
  #     "AA" => {
  #       :type => :_401k,
  #     },
  #     "AB" => {
  #       :type => :roth_ira,
  #     },
  #     "AC" => {
  #       :type => :brokerage,
  #     },
  #     "AD" => {
  #       :type => :roth_ira,
  #     },
  #   }
  #   sequence = strategy.send(:sequence, accounts)
  #   assert_equal [["AC"], ["AA"], ["AB", "AD"]], sequence
  # end
end