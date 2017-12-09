module FortuneTeller
  # An integer that inflates with time
  class InflatingInt
    def initialize(int:, start_date:)
      @int = int
      @start_date = start_date
    end

    def on(date)
      (@int * 1.02**(date.year - @start_date.year)).floor
    end
  end
end
