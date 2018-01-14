module FortuneTeller
  module GuaranteedIncome
    class DayPlan < FortuneTeller::Base::DayPlan
      def initialize(date, *args)
        @start_year = date.year
        @start_month = date.month
        @generator_data = {}
        super(date, *args)
      end

      def start(amount:, annual_increase: 1)
        # TODO: Update InflatingInt to handle arbitrary start date so we can use it here
        @amount = amount
        @annual_increase = annual_increase
      end

      def generator_data(year, month)
        inflation_year = (12 * (year - @start_year) + month - @start_month)/12
        @generator_data[inflation_year] ||= (@amount*(@annual_increase**inflation_year)).round
      end
    end
  end
end