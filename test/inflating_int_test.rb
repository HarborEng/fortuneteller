require 'test_helper'

class InflatingIntTest < MiniTest::Test
  def test_growth
    replacement_income = FortuneTeller::Utils::InflatingInt.new(
      int: 1000_00,
      start_date: Date.today
    )

    growth_rates = FortuneTeller::GrowthRateSet.new(
      { inflation: [1.02, 1.03] },
      start_year: Date.today.year
    )

    assert_equal 1020_00, replacement_income.on(Date.today + 1.year,  growth_rates: growth_rates)
    assert_equal 1050_60, replacement_income.on(Date.today + 2.years, growth_rates: growth_rates)
    assert_equal 1071_61, replacement_income.on(Date.today + 3.years, growth_rates: growth_rates)
    assert_equal 1103_76, replacement_income.on(Date.today + 4.years, growth_rates: growth_rates)

    # let's make sure the caching depends on the particular growth rates.
    higher_rates = FortuneTeller::GrowthRateSet.new(
      { inflation: [1.10, 1.20] },
      start_year: Date.today.year
    )

    assert_equal 1100_00, replacement_income.on(Date.today + 1.year,  growth_rates: higher_rates)
    assert_equal 1320_00, replacement_income.on(Date.today + 2.years, growth_rates: higher_rates)
    assert_equal 1452_00, replacement_income.on(Date.today + 3.years, growth_rates: higher_rates)
    assert_equal 1742_40, replacement_income.on(Date.today + 4.years, growth_rates: higher_rates)
  end

  def test_math
    growth_rates = FortuneTeller::GrowthRateSet.new(
      { inflation: [1.01] }, start_year: Date.today.year
    )
    wages = FortuneTeller::Utils::InflatingInt.new(int: 100_00, start_date: Date.today)

    one_half = wages * 0.50
    div_three = wages / 3
    times_two = wages + wages
    just_one = wages + FortuneTeller::Utils::InflatingInt.zero

    assert_equal 50_50,  one_half.on(Date.today + 1.year, growth_rates: growth_rates)
    assert_equal 33_66,  div_three.on(Date.today + 1.year, growth_rates: growth_rates)
    assert_equal 202_00, times_two.on(Date.today + 1.year, growth_rates: growth_rates)
    assert_equal 101_00, just_one.on(Date.today + 1.year, growth_rates: growth_rates)
  end

  def test_growth_keys
    inflation = FortuneTeller::Utils::InflatingInt.new(
      int: 1000_00,
      start_date: Date.today,
    )

    wage_growth = FortuneTeller::Utils::InflatingInt.new(
      int: 1000_00,
      start_date: Date.today,
      growth_key: :wage_growth
    )

    growth_rates = FortuneTeller::GrowthRateSet.new(
      { inflation:   [1.02, 1.03],
        wage_growth: [1.10, 1.20] },
      start_year: Date.today.year
    )

    assert_equal 1103_76, inflation.on(Date.today + 4.years, growth_rates: growth_rates)
    assert_equal 1742_40, wage_growth.on(Date.today + 4.years, growth_rates: growth_rates)
  end
end