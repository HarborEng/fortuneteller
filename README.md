# FortuneTeller

FortuneTeller is a personal finance simulator built and used by Harbor.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fortuneteller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fortuneteller

## Usage

```ruby
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
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HarborEng/fortuneteller. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fortuneteller project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fortuneteller/blob/master/CODE_OF_CONDUCT.md).
