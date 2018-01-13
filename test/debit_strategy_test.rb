require 'test_helper'

class WithdrawalStrategyTest < MiniTest::Test
  def test_tax_sequence
    strategy = FortuneTeller::Strategies::Debit::TaxSequence.new
    accounts = {
      "AA" => {
        :type => :_401k,
      },
      "AB" => {
        :type => :roth_ira,
      },
      "AC" => {
        :type => :brokerage,
      },
      "AD" => {
        :type => :roth_ira,
      },
    }
    sequence = strategy.send(:sequence, accounts)
    assert_equal [["AC"], ["AB", "AD"], ["AA"]], sequence
  end
end