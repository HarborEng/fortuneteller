module FortuneTeller
  module Job
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :base, :savings_plans
      def initialize(*args)
        @savings_plans = []
        super
      end

      def set(base:)
        @base = FortuneTeller::Utils::InflatingInt.new(
          int: base,
          start_date: date,
          growth_key: :wage_growth,
        )
      end

      def add_savings_plan(percent:, match:, account:, holding:)
        @savings_plans << {
          percent: percent,
          match: match,
          account: account,
          holding: holding
        }
      end

      def monthly_base(on_date, growth_rates:)
        (base.on(on_date, growth_rates: growth_rates) / 12.0).floor
      end

      def calculate_take_home_pay(*args)
        take_home = monthly_base(*args)
        savings_plans.each do |s|
          take_home -= ((s[:percent]/100.0) * take_home).floor
        end
        (take_home - (take_home * 0.3).floor)
      end
    end
  end
end