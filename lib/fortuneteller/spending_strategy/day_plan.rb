module FortuneTeller
  module SpendingStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :strategy, :amount
      def set(strategy:, amount: nil, percent: nil, end_year: nil, withdrawal_rates: nil)
        @strategy = strategy
        @amount = inflating_int(amount, :inflation)
        @percent = percent
        @end_year = end_year
        @withdrawal_rates = withdrawal_rates
      end

      def generator_data
        return nil if @strategy == :remainder
        if @strategy == :exact
          {strategy: :exact, amount: @amount}
        elsif @strategy == :percent
          {strategy: :percent, percent: @percent, day_plan_id: object_id}
        elsif @strategy == :dynamic
          {strategy: :dynamic, withdrawal_rates: @withdrawal_rates, end_year: @end_year}
        end
      end
    end
  end
end