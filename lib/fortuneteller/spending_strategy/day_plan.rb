module FortuneTeller
  module SpendingStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :strategy, :amount
      def set(strategy:, amount: nil, percent: nil)
        @strategy = strategy
        @amount = inflating_int(amount, :inflation)
        @percent = percent
      end

      def generator_data
        return nil if @strategy == :remainder
        if @strategy == :exact
          {strategy: :exact, amount: @amount}
        elsif @strategy == :percent
          {strategy: :percent, percent: @percent, day_plan_id: object_id}
        end
      end
    end
  end
end