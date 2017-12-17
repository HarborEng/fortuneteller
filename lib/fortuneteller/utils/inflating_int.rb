module FortuneTeller
  module Utils
    # An integer that inflates with time
    class InflatingInt
      attr_reader :int

      def initialize(int:, start_date:, growth_key: :inflation)
        @int = int
        @start_date = start_date
        @growth_key = growth_key
        @inflated_cache = {}
      end

      def on(date, growth_rates:)
        adjusted_for(date.year, growth_rates).floor
      end

      private

      def adjusted_for(year, growth_rates)
        # we cache this by the particular set of growth rates, as it will
        # change per each monte carlo simulation, but this object will not be
        # re-instantiated.
        @inflated_cache[growth_rates] ||= {}
        @inflated_cache[growth_rates][year] ||= begin
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
