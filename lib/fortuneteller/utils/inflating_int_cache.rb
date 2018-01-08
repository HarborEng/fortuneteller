module FortuneTeller
  module Utils
    # caches calculations, assuming the same year and growth rate
    class InflatingIntCache
      def initialize(growth_rates)
        @growth_rates = growth_rates
        @cache = Hash.new do |h, k| h[k] = {} end
      end

      def calculate(int, date)
        # puts "CACHE CALC #{date} #{int.initial_value}"
        # @cache[int.growth_key][int.initial_value] ||=
          int.on(date, growth_rates: @growth_rates)
      end
    end
  end
end