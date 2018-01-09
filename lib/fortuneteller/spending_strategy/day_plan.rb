module FortuneTeller
  module SpendingStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :strategy, :amount
      def set(strategy:, amount: nil)
        @strategy = strategy
        @amount = inflating_int(amount, :inflation)
      end

      def generator_data
        return nil if @strategy == :remainder
        @amount
      end
    end
  end
end