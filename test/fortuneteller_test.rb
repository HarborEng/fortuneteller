require 'test_helper'

class FortuneTellerTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::FortuneTeller::VERSION
  end

  def test_add_users
    sim = FortuneTeller.new(Date.today)

    sim.add_primary(
      gender: :female,
      birthday: Date.new(1964, 3, 2)
    )

    sim.add_partner(
      gender: :male,
      birthday: Date.new(1966, 5, 5)
    )

    assert_equal :female, sim.primary.gender
    assert_equal Date.new(1964, 3, 2), sim.primary.birthday
    assert_equal :male, sim.partner.gender
    assert_equal Date.new(1966, 5, 5), sim.partner.birthday
  end

  def test_add_accounts
    sim = FortuneTeller.new(Date.today)

    sim.add_account(:primary) do |plan|
      plan.beginning.set(
        type: :_401k,
        balances: {
          stocks: 300_000_00,
          bonds:  200_000_00
        }
      )
    end

    assert_equal sim.accounts.size, 1
    
    new_account = sim.accounts.values.first
    assert_equal new_account.plan.day_plans.size, 1
    assert_equal(new_account.plan.day_plans.first.balances,
      {
        stocks: 300_000_00,
        bonds:  200_000_00
      }
    )
  end

  def test_account_state
    sim = FortuneTeller.new(Date.today)

    sim.set_growth_rates(
      stocks: [1.05], bonds: [1.05]
    )

    account_generator = sim.add_account(:primary) do |plan|
      plan.beginning.set(
        type: :_401k,
        balances: {
          stocks: 300_000_00,
          bonds:  200_000_00
        }
      )
    end

    state = account_generator.initial_state(start_date: Date.today, growth_rates: sim.growth_rates)

    assert_equal(state.balances,
      {
        stocks: 300_000_00,
        bonds:  200_000_00
      }
    )

    state.credit(amount: 1_000_00, holding: :stocks, on: Date.today)
    assert_equal state.balances[:stocks], 301_000_00
  end

  def test_set_growth_rates
    Timecop.freeze(Date.parse('2017-01-01')) do
      sim = FortuneTeller.new(Date.today)
      sim.set_growth_rates(stocks: [1.25])

      account_generator = sim.add_account(:primary) do |plan|
        plan.beginning.set(
          type: :_401k,
          balances: {
            stocks: 1000_00,
          }
        )
      end

      this_year = sim.send :initial_state
      this_year.pass_time(to: Date.parse('2018-01-01'))
      assert_equal({ stocks: 1250_00 }, this_year.accounts['AA'].balances)
    end
  end

  def test_set_wage_growth
    sim = FortuneTeller.new(Date.today)
    sim.set_growth_rates(wage_growth: [1.02])

    sim.add_job(:primary) do |plan|
      plan.beginning.set(base: 120_000_00)
    end

    assert_equal 7_140_00, sim.calculate_take_home_pay(Date.today + 1.year)
  end

  def real_estate
    sim.add_real_estate do |plan|
      plan.beginning do |p|
        p.init(
          address: "123 Comm Ave",
          zip_code: "02116",
          value: 3_000_000_00
        )
        p.add_mortgage(
          amount: 1500,
          interest: 1.04
        )
        p.add_taxes(
          amount: 1500,
          interest: 1.04
        )
      end
      plan.on(primary_retirement).sell
    end
  end
end
