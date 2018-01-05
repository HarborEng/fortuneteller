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

      def generator_data
        return @generator_data unless @generator_data.nil?

        wages = base / 12.0
        account_credits = {}
        income = {
          wages: wages,
          saved: Utils::InflatingInt.zero,
          matched: Utils::InflatingInt.zero,
          pay_period: :monthly
        }

        savings_plans.each do |p|
          saved = wages * (p[:percent] / 100.0)
          income[:saved] = saved + income[:saved]

          matched = wages * (p[:match] / 100.0)
          income[:matched] = matched + income[:matched]

          account_credits[p[:account].key] = { p[:holding] => saved + matched }
        end

        @generator_data = { account_credits: account_credits, income: income }        
      end
    end
  end
end