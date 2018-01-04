module FortuneTeller
  module Account
    class Component < FortuneTeller::Base::Component
      def initial_state(start_date:, growth_rates:)
        initial = plan.to_reader.on(start_date)
        Account::State.new(
          start_date: start_date,
          growth_rates: growth_rates,
          balances: Hash.new(0).merge(initial.balances),
          account_ref: self
        )
      end
    end
  end
end