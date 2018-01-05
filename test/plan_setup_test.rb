require 'test_helper'

class UserTest < MiniTest::Test

  def growth_rates
    {
      stocks:       [1.15],
      bonds:        [1.45],
      wage_growth:  [1.30],
      inflation:    [1.12]
    }
  end

  def test_no_person
    sim = FortuneTeller.new(Date.today)
    assert_raises(FortuneTeller::PlanSetupError) do
      sim.simulate(growth_rates: growth_rates)
    end
  end

  def test_no_primary_person
    sim = FortuneTeller.new(Date.today)
    sim.add_partner(
      gender: :male,
      birthday: Date.new(1966, 5, 5)
    )
    assert_raises(FortuneTeller::PlanSetupError) do
      sim.simulate(growth_rates: growth_rates)
    end
  end

  def test_plan_finalized
    sim = FortuneTeller::Benchmark.create_sim

    sim.simulate(growth_rates: growth_rates)

    assert_raises(FortuneTeller::PlanSetupError) do
      sim.add_partner(
        gender: :male,
        birthday: Date.new(1966, 5, 5)
      )
    end

    assert_raises(FortuneTeller::PlanSetupError) do
      sim.add_account(:primary) do |plan|
        plan.beginning.set(
          type: :_401k,
          balances: {
            stocks: 300_000_00,
            bonds:  200_000_00
          }
        )
      end
    end
  end
end