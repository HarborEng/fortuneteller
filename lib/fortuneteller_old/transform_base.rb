module FortuneTeller
  # Provides base functionality to inheriting transform classes
  class TransformBase
    attr_reader :date, :holder
    def initialize(date:, holder:)
      @date = date
      @holder = holder
    end

    def <=>(other)
      date <=> other.date
    end
  end
end
