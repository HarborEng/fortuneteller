module FortuneTeller
  module Utils
    # caches calculations, assuming the same year and growth rate
    class InflatingIntCache
      def initialize(growth_rates)
        @growth_rates = growth_rates
        @cache = Hash.new do |h, k| h[k] = {} end
      end

      def calculate(int, date)
        @cache[int.growth_key][[date.year, int.initial_value]] ||=
          int.on(date, growth_rates: @growth_rates)
      end

      def calculate_year(int, year)
        @cache[int.growth_key][[year, int.initial_value]] ||=
          int.on_year(year, growth_rates: @growth_rates)
      end
    end
  end
end