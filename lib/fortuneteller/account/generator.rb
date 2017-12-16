module FortuneTeller
  module Account
    class Generator < FortuneTeller::Base::Generator
      def initial_state(start_date:)
        initial = plan.to_reader.on(start_date)
        Account::State.new(
          start_date: start_date,
          balances: Hash.new(0).merge(initial.balances),
          account_ref: self
        )
      end
    end
  end
end