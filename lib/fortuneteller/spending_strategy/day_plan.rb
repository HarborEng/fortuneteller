module FortuneTeller
  module SpendingStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :strategy, :amount
      def set(strategy:, amount: nil)
        @strategy = strategy
        @amount = amount
      end
    end
  end
end