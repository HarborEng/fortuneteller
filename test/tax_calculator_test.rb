require 'test_helper'

class TaxCalculatorTest < Minitest::Test
  def test_build_adjusted_bracket
    calc = FortuneTeller::Utils::TaxCalculator.new(
      bracket_lib: FortuneTeller::Utils::TAX_BRACKETS_2017_Q3,
      state: :alabama,
      filing_status: :single,
    )
    brackets = calc.send(:build_adjusted_brackets, :alabama)
    
    expected = [
      {:pretax_min=>0, :pretax_max=>250000, :posttax_min=>0, :posttax_max=>250000, :marginal_rate=>0}, 
      {:pretax_min=>250000, :pretax_max=>300000, :posttax_min=>250000, :posttax_max=>299000, :marginal_rate=>2}, 
      {:pretax_min=>300000, :pretax_max=>550000, :posttax_min=>299000, :posttax_max=>539000, :marginal_rate=>4}, 
      {:pretax_min=>550000, :pretax_max=>nil, :posttax_min=>539000, :posttax_max=>nil, :marginal_rate=>5}
    ]

    assert_equal(expected, brackets)
  end

  def test_build_adjusted_bracket_none
    calc = FortuneTeller::Utils::TaxCalculator.new(
      bracket_lib: FortuneTeller::Utils::TAX_BRACKETS_2017_Q3,
      state: :florida,
      filing_status: :single,
    )
    brackets = calc.send(:build_adjusted_brackets, :florida)
    
    assert_nil brackets
  end

  def test_build_adjusted_bracket_with_zero_bracket
    # Some states have a 0 bracket in addition to a deduction.  Make sure those get merged appropriately
    calc = FortuneTeller::Utils::TaxCalculator.new(
      bracket_lib: FortuneTeller::Utils::TAX_BRACKETS_2017_Q3,
      state: :south_carolina,
      filing_status: :single,
    )
    brackets = calc.send(:build_adjusted_brackets, :south_carolina)

    expected = [
      {:pretax_min=>0, :pretax_max=>922000, :posttax_min=>0, :posttax_max=>922000, :marginal_rate=>0}, 
      {:pretax_min=>922000, :pretax_max=>1214000, :posttax_min=>922000, :posttax_max=>1205240, :marginal_rate=>3}, 
      {:pretax_min=>1214000, :pretax_max=>1506000, :posttax_min=>1205240, :posttax_max=>1485560, :marginal_rate=>4}, 
      {:pretax_min=>1506000, :pretax_max=>1798000, :posttax_min=>1485560, :posttax_max=>1762960, :marginal_rate=>5}, 
      {:pretax_min=>1798000, :pretax_max=>2090000, :posttax_min=>1762960, :posttax_max=>2037440, :marginal_rate=>6}, 
      {:pretax_min=>2090000, :pretax_max=>nil, :posttax_min=>2037440, :posttax_max=>nil, :marginal_rate=>7}
    ]

    assert_equal(expected, brackets)
  end

end