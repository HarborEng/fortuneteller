module FortuneTeller
  module SpendingStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :strategy, :amount
      def set(strategy:, amount: nil)
        @strategy = strategy
        @amount = inflating_int(amount, :inflation)
      end

      def generator_data(simulator, year, month)
        return nil if @strategy == :remainder
        take_homes = simulator.take_homes_without_withdrawals(year, month)
        {amount: @amount, take_homes: take_homes}
      end
    end
  end
end