require 'test_helper'
require 'date'

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

  def test_simulation
    # Initialize FortuneTeller
    sim = FortuneTeller.new(Date.today)

    sim.add_primary(
      gender: :female,
      birthday: Date.new(1964, 3, 2)
    )

    sim.add_partner(
      gender: :male,
      birthday: Date.new(1966, 5, 5)
    )

    # Define primary's key events and holdings
    primary_retirement = Date.new(2031, 3, 1)

    primary_401k = sim.add_account(:primary) do |plan|
      plan.beginning.set(
        type: :_401k,
        balance: 500_000_00
      )
    end

    sim.add_job(:primary) do |plan|
      plan.beginning do |p|
        p.set(
          base: 100_000_00,
        )
        p.add_savings_plan(
          percent: 7,
          match: 3,
          account: primary_401k
        )
      end
      plan.on(primary_retirement).stop
    end

    sim.add_social_security(:primary) do |plan|
      plan.on(primary_retirement).start
    end

    # Define partner's key events and holdings
    partner_retirement = Date.new(2033, 5, 1)

    partner_401k = sim.add_account(:partner) do |plan|
      plan.beginning.set(
        type: :_401k,
        balance: 200_000_00
      )
    end

    sim.add_job(:partner) do |plan|
      plan.beginning do |p|
        p.set(
          base: 75_000_00,
        )
        p.add_savings_plan(
          percent: 7,
          match: 3,
          account: partner_401k
        )
      end
      plan.on(partner_retirement).stop
    end

    sim.add_social_security(:partner) do |plan|
      plan.on(partner_retirement).start(
        pia: 1000_00
      )
    end

    # Start by spending the leftovers (after tax and saving) and change to
    # spending an exact amount in retirement

    sim.add_spending_strategy do |plan|
      plan.beginning.set(
        strategy: :remainder
      )
      future_take_home_pay = (sim.calculate_take_home_pay(Date.today) * 0.8).floor
      plan.on(primary_retirement).set(
        strategy: :exact,
        amount: sim.inflating_int(future_take_home_pay)
      )
    end

    sim.add_tax_strategy do |plan|
      plan.beginning.set(
        primary: :married_filing_jointly,
        partner: :married_filing_jointly
      )
    end
    # Run!
    sim.simulate
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
