module FortuneTeller
  module Utils
    # An integer that inflates with time
    class InflatingInt
      BaseMismatch = Class.new(StandardError)

      def self.zero
        @zero ||= new(int: 0, start_date: nil, growth_key: nil).freeze
      end

      attr_reader :start_date, :start_year, :growth_key

      def initialize(int:, start_date:, growth_key: :inflation)
        @int = int
        @start_date = start_date
        @start_year = (start_date.nil? ? nil : start_date.year)
        @growth_key = growth_key
        @inflated_cache = {}
      end

      def on_year(year, growth_rates:)
        adjusted_for(year, growth_rates).round
      end

      def on(date, growth_rates:)
        adjusted_for(date.year, growth_rates).round
      end

      def initial_value
        @int
      end

      def *(coef)
        dup_with_value(@int * coef)
      end

      def /(denom)
        dup_with_value(@int / denom)
      end

      def +(other)
        if other.initial_value.zero? || (@start_date == other.start_date && @growth_key == other.growth_key)
          dup_with_value(@int + other.initial_value)
        else
          raise BaseMismatch 
        end
      end

      def -(other)
        if other.initial_value.zero? || (@start_date == other.start_date && @growth_key == other.growth_key)
          dup_with_value(@int - other.initial_value)
        else
          raise BaseMismatch 
        end
      end

      private

      def dup_with_value(val)
        self.class.new(
          int: val,
          start_date: @start_date,
          growth_key: @growth_key
        )
      end

      def adjusted_for(year, growth_rates)
        if initial_value.zero?
          0
        elsif year <= @start_date.year
          @int
        else
          growth_rates.cumulative(@growth_key, @start_date.year, year) * @int
        end
      end
    end
  end
end
