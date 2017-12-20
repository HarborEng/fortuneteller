module FortuneTeller
  class GrowthRateSet
    attr_reader :growth_rates, :start_year

    def initialize(growth_rates, start_year:)
      @growth_rates = growth_rates
      @start_year = start_year
      @daily_cache = {}
      @cumulative_cache = {}
    end

    def cumulative(key, year)
      if year <= start_year
        1
      else
        @cumulative_cache[[key, year]] ||=
          annually(key, year - 1) * cumulative(key, year - 1)
      end
    end

    def annually(key, year)
      return 0 unless growth_rates.key?(key)

      list = growth_rates[key]
      list[(year - start_year) % list.size]
    end

    def daily(key, year)
      @daily_cache[[key, year]] ||= annually(key, year) ** (1/365.00)
    end

    def hash_key(key)
      @growth_rates[key].hash
    end
  end
end