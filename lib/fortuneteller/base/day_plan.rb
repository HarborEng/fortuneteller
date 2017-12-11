module FortuneTeller
  module Base
    class DayPlan
      attr_accessor :date
      def initialize(date, &block)
        @date = date
        @stopped = false
        if block_given?
          yield(self)
        else
          self
        end
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