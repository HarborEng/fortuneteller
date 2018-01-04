module FortuneTeller
  module SpendingStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :strategy, :amount
      def set(strategy:, amount: nil)
        @strategy = strategy
        @amount = inflating_int(amount, :inflation)
      end
    end
  end
end