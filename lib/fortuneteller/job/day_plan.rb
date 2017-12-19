module FortuneTeller
  module Job
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :base, :savings_plans
      def initialize(*args)
        @savings_plans = []
        super
      end

      def set(base:)
        @base = inflating_int(base, :wage_growth)
      end

      def add_savings_plan(percent:, match:, account:, holding:)
        @savings_plans << {
          percent: percent,
          match: match,
          account: account,
          holding: holding
        }
      end
    end
  end
end