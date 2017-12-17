module FortuneTeller
  module Base
    class Plan
      attr_reader :day_plans, :start_date, :end_date
      def initialize(beginning)
        @beginning = beginning
        @day_plans = []
        yield(self) if block_given?
      end

      def finalize
        @start_date = @day_plans.first.date
        @end_date = (@day_plans.last.stopped? ? @day_plans.last.date : nil)
      end

      def on(date, &block)
        if @day_plans.empty? or date > @day_plans.last.date
          @day_plans << self.class.parent::DayPlan.new(date, &block)
          @day_plans.last
        else
          raise "Plans must be made in order.  #{date} is not after #{@day_plans.last.date}"
        end
      end

      def beginning(&block)
        on(@beginning, &block)
      end

      def to_reader
        FortuneTeller::Base::PlanReader.new(self)
      end
    end
  end
end