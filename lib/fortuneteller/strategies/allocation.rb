module FortuneTeller::Strategies
  module Allocation
    def self.new(strategy:, **kwargs)
      strategies = {
        none: self::None,
        annual: self::Annual
      }
      return strategies[strategy].new(**kwargs)
    end
  end
end