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
# Define whose finances we're simulating
primary = FortuneTeller::Person.new(gender: :female, birthday: Date.parse('1958-03-02') )
partner = FortuneTeller::Person.new(gender: :male, birthday: Date.parse('1960-05-20') )

# Initialize FortuneTeller
ft = FortuneTeller.new(primary: primary, partner: partner)

ft.setFilingStatus(:married_filing_jointly)

# Define primary's key events and holdings
primary_retirement = Date.parse('2025-01-01')

account = FortuneTeller::Account.new(type: :_401k, balance: 10000000)
primary_401k = ft.addAccount(account, :primary)

job = FortuneTeller::Job.new(salary: 6500000, end: primary_retirement)
job.setSavingsPlan(percent: 5, match: 3, account_id: primary_401k)
ft.addJob(job, :primary)

primary_ss = FortuneTeller::SocialSecurity.new(start: primary_retirement)
ft.setSocialSecurity(primary_ss, :primary)

# Define partner's key events and holdings
partner_retirement = Date.parse('2027-01-01')

account = FortuneTeller::Account.new(type: :_401k, balance: 20000000)
partner_401k = ft.addAccount(account, :partner)

job = FortuneTeller::Job.new(salary: 6500000, end: partner_retirement)
job.setSavingsPlan(percent: 9, match: 3, account_id: partner_401k)
ft.addJob(job, :partner)

partner_ss = FortuneTeller::SocialSecurity.new(start: partner_retirement)
ft.setSocialSecurity(partner_ss, :partner)

# Start by spending the leftovers (after tax and saving) and change to spending an exact amount in retirement
spendingStrategy = FortuneTeller::SpendingStrategy.new(strategy: :remainder)
spendingStrategy.schedule(primary_retirement, 'updateStrategy', :exact_before_inflation, ft.getTakeHomePay(:start))
ft.setSpendingStrategy(spendingStrategy)

# Run!
results = ft.simulate
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fortuneteller. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fortuneteller project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fortuneteller/blob/master/CODE_OF_CONDUCT.md).
