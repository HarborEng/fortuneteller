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

  def test_merging_brackets
    # Some states have a 0 bracket in addition to a deduction.  Make sure those get merged appropriately
    custom_lib = {
      federal: {
        single: {
          deductions: [{deduction_amount: 10000}],
          income_tax_brackets: [
            {bracket: 0, marginal_rate: 0},
            {bracket: 90000, marginal_rate: 10},
            {bracket: 190000, marginal_rate: 20}
          ]
        }
      },
      state: {
        single: {
          deductions: [],
          income_tax_brackets: [
            {bracket: 0, marginal_rate: 0},
            {bracket: 25000, marginal_rate: 5},
            {bracket: 75000, marginal_rate: 10},
            {bracket: 150000, marginal_rate: 15},
          ]
        }        
      }
    }

    calc = FortuneTeller::Utils::TaxCalculator.new(
      bracket_lib: custom_lib,
      state: :state,
      filing_status: :single,
    )
    brackets = calc.instance_variable_get(:@brackets)
    expected = [
      {:pretax_min=>0, :pretax_max=>2500000, :posttax_min=>0, :posttax_max=>2500000, :marginal_rate=>0}, 
      {:pretax_min=>2500000, :pretax_max=>7500000, :posttax_min=>2500000, :posttax_max=>7250000, :marginal_rate=>5}, 
      {:pretax_min=>7500000, :pretax_max=>10000000, :posttax_min=>7250000, :posttax_max=>9500000, :marginal_rate=>10}, 
      {:pretax_min=>10000000, :pretax_max=>15000000, :posttax_min=>9500000, :posttax_max=>13500000, :marginal_rate=>20}, 
      {:pretax_min=>15000000, :pretax_max=>20000000, :posttax_min=>13500000, :posttax_max=>17250000, :marginal_rate=>25}, 
      {:pretax_min=>20000000, :pretax_max=>nil, :posttax_min=>17250000, :posttax_max=>nil, :marginal_rate=>35}
    ]
    assert_equal(expected, brackets)
  end

  def test_inflating_brackets
    custom_lib = {
      federal: {
        single: {
          deductions: [{deduction_amount: 10000}],
          income_tax_brackets: [
            {bracket: 0, marginal_rate: 0},
            {bracket: 90000, marginal_rate: 10},
            {bracket: 190000, marginal_rate: 20}
          ]
        }
      },
      state: {
        single: {
          deductions: [],
          income_tax_brackets: [
            {bracket: 0, marginal_rate: 0},
            {bracket: 25000, marginal_rate: 5},
            {bracket: 75000, marginal_rate: 10},
            {bracket: 150000, marginal_rate: 15},
          ]
        }        
      }
    }

    calc = FortuneTeller::Utils::TaxCalculator.new(
      bracket_lib: custom_lib,
      state: :state,
      filing_status: :single,
      inflation: 2.0
    )
    brackets = calc.instance_variable_get(:@brackets)
    expected = [
      {:pretax_min=>0, :pretax_max=>5000000, :posttax_min=>0, :posttax_max=>5000000, :marginal_rate=>0}, 
      {:pretax_min=>5000000, :pretax_max=>15000000, :posttax_min=>5000000, :posttax_max=>14500000, :marginal_rate=>5}, 
      {:pretax_min=>15000000, :pretax_max=>20000000, :posttax_min=>14500000, :posttax_max=>19000000, :marginal_rate=>10}, 
      {:pretax_min=>20000000, :pretax_max=>30000000, :posttax_min=>19000000, :posttax_max=>27000000, :marginal_rate=>20}, 
      {:pretax_min=>30000000, :pretax_max=>40000000, :posttax_min=>27000000, :posttax_max=>34500000, :marginal_rate=>25}, 
      {:pretax_min=>40000000, :pretax_max=>nil, :posttax_min=>34500000, :posttax_max=>nil, :marginal_rate=>35}
    ]
    assert_equal(expected, brackets)    
  end

end