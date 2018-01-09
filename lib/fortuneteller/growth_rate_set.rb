module FortuneTeller
  class GrowthRateSet
    attr_reader :growth_rates, :start_year

    def initialize(growth_rates, start_year:)
      @growth_rates = growth_rates
      @keys = growth_rates.keys
      @start_year = start_year
      @daily_cache = {}
      @cumulative_cache = Hash.new do |h, key|
        h[key] = Hash.new do |h2, from_year|
          h2[from_year] = {}
        end
      end
    end

    def cumulative(key, from_year, to_year)
      if to_year <= from_year
        1
      else
        @cumulative_cache[key][from_year][to_year] ||=
          annually(key, to_year - 1) * cumulative(key, from_year, to_year - 1)
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