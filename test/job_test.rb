require 'test_helper'

class JobTest < MiniTest::Test
  def test_wage_growth

    sim = MiniTest::Mock.new
    sim.expect(:years, (Date.today.year..(Date.today.year+1)))

    growth_rates = FortuneTeller::GrowthRateSet.new(
      { wage_growth: [1.02] }, start_year: Date.today.year
    )

    component = FortuneTeller::Job::Component.new('AA', Date.today) do |plan|
      plan.beginning.set(base: 120_000_00)
    end

    component.build_generators(sim)

    sim.verify

    cashflows = component.generators[(Date.today.year+1)].gen_cashflows

    assert_equal 10200_00, cashflows.first[:w2_income].on_year((Date.today.year + 1), growth_rates: growth_rates)
  end
end