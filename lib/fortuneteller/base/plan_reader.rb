module FortuneTeller
  module Base
    class PlanReader
      def initialize(plan)
        @plan = plan
      end

      # TODO: hold an internal state instead of looping each time
      def on(date)
        @plan.day_plans.each_with_index do |d, i|
          if date < d.date
            return (i == 0 ? nil : @plan.day_plans[i-1])
          end
        end
        (@plan.day_plans.last.stopped? ? nil : @plan.day_plans.last)
      end
    end
  end
end