module FortuneTeller
  module Base
    class DayPlan
      attr_accessor :date
      def initialize(date, plan, &block)
        @date = date
        @plan = plan
        @stopped = false
        yield(self) if block_given?
        self
      end

      def inflating_int(val, growth_key = :inflation)
        Utils::InflatingInt.new(
          int: val,
          start_date: @plan.beginning_date,
          growth_key: growth_key
        )
      end

      def stopped?
        @stopped
      end

      def stop
        @stopped = true
      end
    end
  end
end