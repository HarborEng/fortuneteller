module FortuneTeller
  module Base
    class Component
      attr_reader :plan, :key, :holder, :generators
      def initialize(key, beginning=nil, holder=nil, &block)
        @key = key
        @holder = holder
        @beginning = beginning
        @plan = self.class.parent::Plan.new(beginning, &block)
        @plan.finalize
        @start_date = @plan.start_date
        @end_date = @plan.end_date
        @generators = {}
      end

      private

      # This avoids the time calculations involved in Date#beginning_of_month
      # for a slight speedup.
      def next_month(from)
        from.next_month.change(day: 1)
      end

    end
  end
end
