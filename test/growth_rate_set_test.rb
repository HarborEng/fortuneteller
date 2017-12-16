require 'test_helper'
require 'date'

class GrowthRateSetTest < Minitest::Test
  def test_repeating_behavior
    set = FortuneTeller::GrowthRateSet.new(
      { bonds: [1, 2, 3], stocks: [4, 5] },
      start_year: 2017
    )

    assert_equal set.annually(:bonds, 2017), 1
    assert_equal set.annually(:bonds, 2018), 2
    assert_equal set.annually(:bonds, 2019), 3
    assert_equal set.annually(:bonds, 2020), 1

    assert_equal set.annually(:stocks, 2017), 4
    assert_equal set.annually(:stocks, 2018), 5
    assert_equal set.annually(:stocks, 2019), 4
    assert_equal set.annually(:stocks, 2020), 5
  end

  def test_daily_growth_rate
    set = FortuneTeller::GrowthRateSet.new(
      { stocks: [1.05] },
      start_year: 2017
    )

    assert_equal set.daily(:stocks, 2017), (1.05)**(1/365.0)
  end
end