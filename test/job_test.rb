require 'test_helper'

class JobTest < MiniTest::Test
  def test_wage_growth
    sim = MiniTest::Mock.new
    sim.expect(:start_year, Date.today.year)
    sim.expect(:end_year, Date.today.year+1)
    sim.expect(:beginning, Date.today)

    growth_rates = FortuneTeller::GrowthRateSet.new(
      { wage_growth: [1.02] }, start_year: Date.today.year
    )

    component = FortuneTeller::Job::Component.new('AA', Date.today) do |plan|
      plan.beginning.set(base: 120_000_00)
    end

    component.build_generators(sim)

    transforms = component.generators[(Date.today.year+1)].gen_transforms(simulator: sim)

    assert_equal 10200_00, transforms.first.income[:wages].on(Date.today + 1.year, growth_rates: growth_rates)

    sim.verify
  end
end