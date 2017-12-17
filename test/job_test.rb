require 'test_helper'

class JobTest < MiniTest::Test
  def test_wage_growth
    job_plan = FortuneTeller::Job::Plan.new(Date.today) do |j|
      j.beginning.set(base: 120_000_00)
    end

    growth_rates = FortuneTeller::GrowthRateSet.new(
      { wage_growth: [1.02, 1.03] },
      start_year: Date.today.year  
    )

    today = job_plan.to_reader.on(Date.today)
    assert_equal 7_000_00, today.calculate_take_home_pay(Date.today, growth_rates)

    next_year = job_plan.to_reader.on(Date.today + 1.year)
    assert_equal 7_140_00, next_year.calculate_take_home_pay(Date.today + 1.year, growth_rates)

    next_year = job_plan.to_reader.on(Date.today + 2.years)
    assert_equal 7_354_20, next_year.calculate_take_home_pay(Date.today + 2.years, growth_rates)
  end

  def test_wage_growth_in_transforms
    sim = MiniTest::Mock.new
    growth_rates = MiniTest::Mock.new
    sim.expect(:growth_rates, growth_rates)
    growth_rates.expect(:annually, 1.02, [:wage_growth, Date.today.year])

    generator = FortuneTeller::Job::Generator.new('AA', Date.today) do |plan|
      plan.beginning.set(base: 120_000_00)
    end

    transforms = generator.bounded_gen_transforms(
      from: Date.today + 1.year,
      to: Date.today + 2.years,
      simulator: sim
    )

    assert_equal 10200_00, transforms.first.income[:wages]

    sim.verify
    growth_rates.verify
  end
end