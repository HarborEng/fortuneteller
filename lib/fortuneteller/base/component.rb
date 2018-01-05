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

      def bounded_gen_transforms(from:, to:, simulator:)
        return [] if out_of_range?(from: from, to: to)
        from = tighten_from(from)
        to = tighten_to(to)
        gen_transforms(from: from, to: to, simulator: simulator)
      end

      private

      # This avoids the time calculations involved in Date#beginning_of_month
      # for a slight speedup.
      def next_month(from)
        from.next_month.change(day: 1)
      end

      def out_of_range?(from:, to:)
        return true if !@start_date.nil? && (to < @start_date)
        return true if !@end_date.nil? && (from >= @end_date)
        false
      end

      def tighten_from(from)
        return from if @start_date.nil?
        [from, @start_date].max
      end

      def tighten_to(to)
        return to if @end_date.nil?
        [to, @end_date].min
      end
    end
  end
end
