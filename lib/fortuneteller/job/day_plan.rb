module FortuneTeller
  module Job
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :base, :savings_plans
      def initialize(*args)
        @savings_plans = []
        super
      end

      def set(base:)
        @base = base
      end

      def add_savings_plan(percent:, match:, account:, holding:)
        @savings_plans << {
          percent: percent,
          match: match,
          account: account,
          holding: holding
        }
      end

      def calculate_take_home_pay
        take_home = (base/12.0).floor
        savings_plans.each do |s|
          take_home -= ((s[:percent]/100.0) * take_home).floor
        end
        (take_home - (take_home * 0.3).floor)
      end
    end
  end
end