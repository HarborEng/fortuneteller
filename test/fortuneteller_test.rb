require 'test_helper'
require 'date'

class FortuneTellerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FortuneTeller::VERSION
  end

  def test_simulation
    # Initialize FortuneTeller
    sim = FortuneTeller.new

    sim.primary = FortuneTeller::Person.new(
      gender: :female,
      birthday: Date.new(1964, 3, 2),
      filing_status: :married_filing_jointly
    )

    sim.partner = FortuneTeller::Person.new(
      gender: :male,
      birthday: Date.new(1967, 5, 5),
      filing_status: :married_filing_jointly
    )

    # Define primary's key events and holdings
    primary_retirement = Date.new(2032, 3, 1)

    account = FortuneTeller::Account.new(
      holder: :primary,
      type: :_401k,
      balance: 500_000_00
    )
    primary_401k = sim.add_account(account)

    job = FortuneTeller::Job.new(
      holder: :primary,
      salary: 100_000_00,
      end_date: primary_retirement
    )
    savings_plan = FortuneTeller::SavingsPlans::Percent.new(
      percent: 7,
      match: 3,
      account_id: primary_401k
    )
    job.add_savings_plan(savings_plan)
    sim.add_job(job)

    primary_ss = FortuneTeller::SocialSecurity.new(
      holder: :primary,
      start_date: primary_retirement,
      pia: 1000_00
    )
    sim.add_social_security(primary_ss)

    # Define partner's key events and holdings
    partner_retirement = Date.new(2032, 6, 1)

    account = FortuneTeller::Account.new(
      holder: :partner,
      type: :_401k,
      balance: 200_000_00
    )
    partner_401k = sim.add_account(account)

    job = FortuneTeller::Job.new(
      holder: :partner,
      salary: 75_000_00,
      end_date: partner_retirement
    )
    savings_plan = FortuneTeller::SavingsPlans::Percent.new(
      percent: 7,
      match: 3,
      account_id: partner_401k
    )
    job.add_savings_plan(savings_plan)
    sim.add_job(job)

    partner_ss = FortuneTeller::SocialSecurity.new(
      holder: :partner,
      start_date: partner_retirement,
      pia: 1000_00
    )
    sim.add_social_security(partner_ss)

    # Start by spending the leftovers (after tax and saving) and change to
    # spending an exact amount in retirement

    spending = FortuneTeller::SpendingStrategy.new(strategy: :remainder)
    future_take_home_pay = (sim.calculate_take_home_pay(:start) * 0.8).floor
    spending.on(primary_retirement).update(
      strategy: :exact,
      amount: sim.inflating_int(future_take_home_pay)
    )
    sim.spending_strategy = spending

    # Run!
    sim.simulate
  end
end
