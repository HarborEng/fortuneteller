require 'test_helper'

class JobTest < MiniTest::Test
  def test_wage_growth
    sim = MiniTest::Mock.new
    growth_rates = FortuneTeller::GrowthRateSet.new(
      { wage_growth: [1.02] }, start_year: Date.today.year
    )

    generator = FortuneTeller::Job::Generator.new('AA', Date.today) do |plan|
      plan.beginning.set(base: 120_000_00)
    end

    transforms = generator.bounded_gen_transforms(
      from: Date.today + 1.year,
      to: Date.today + 2.years,
      simulator: sim
    )

    assert_equal 10200_00, transforms.first.income[:wages].on(Date.today + 1.year, growth_rates: growth_rates)

    sim.verify
  end
end