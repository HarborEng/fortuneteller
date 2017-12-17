module FortuneTeller
  module Job
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :base, :savings_plans
      def initialize(*args)
        @savings_plans = []
        @adjusted_base = {}
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

      def adjusted_base(year, growth_rates)
        @adjusted_base[year] ||= begin
          if year <= date.year
            base
          else
            adjusted_base(year - 1, growth_rates) *
              growth_rates.annually(:wage_growth, year - 1)
          end
        end
      end

      def adjusted_monthly_base(*args)
        (adjusted_base(*args) / 12.0).floor
      end

      def calculate_take_home_pay(on_date, growth_rates)
        take_home = adjusted_monthly_base(on_date.year, growth_rates)
        savings_plans.each do |s|
          take_home -= ((s[:percent]/100.0) * take_home).floor
        end
        (take_home - (take_home * 0.3).floor)
      end
    end
  end
end