require 'test_helper'

class WithdrawalStrategyTest < MiniTest::Test
  def test_tax_sequence
    strategy = FortuneTeller::Strategies::Withdrawal::TaxSequence.new
    accounts = {
      "AA" => {
        :type => :_401k,
      },
      "AD" => {
        :type => :roth_ira,
      },
      "AB" => {
        :type => :roth_ira,
      },
      "AC" => {
        :type => :brokerage,
      },
    }
    sequence = strategy.send(:sequence, accounts)
    assert_equal ["AC", "AB", "AD", "AA"], sequence
  end
end