module FortuneTeller
  module Utils
    # An integer that inflates with time
    class InflatingInt
      BaseMismatch = Class.new(StandardError)

      def self.zero
        @zero ||= new(int: 0, start_date: nil, growth_key: nil).freeze
      end

      attr_reader :start_date, :growth_key

      def initialize(int:, start_date:, growth_key: :inflation)
        @int = int
        @start_date = start_date
        @growth_key = growth_key
        @inflated_cache = {}
      end

      def on(date, growth_rates:)
        adjusted_for(date.year, growth_rates).floor
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
        if other.initial_value.zero? || (@start_date == other.start_date || @growth_key == other.growth_key)
          dup_with_value(@int + other.initial_value)
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
        # we cache this by the particular set of growth rates, as it will
        # change per each monte carlo simulation, but this object will not be
        # re-instantiated.
        hash_key = growth_rates.hash_key(@growth_key)
        @inflated_cache[hash_key] ||= {}
        @inflated_cache[hash_key][year] ||= begin
          if year <= @start_date.year
            @int
          else
            (adjusted_for(year - 1, growth_rates) *
              growth_rates.annually(@growth_key, year - 1))
          end
        end
      end
    end
  end
end
