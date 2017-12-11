module FortuneTeller
  module Base
    class DayPlan
      attr_accessor :date
      def initialize(date, &block)
        @date = date
        @stopped = false
        yield(self) if block_given?
        self
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