module FortuneTeller
  # Representation of an account being simulated with FortuneTeller
  class Cashflow
    attr_accessor :line_items
    def initialize(**args)
      @line_items = args
    end

    def merge!(other)
      @line_items.merge!(other.line_items) { |_k, a, b| (a + b) }
      self
    end

    def as_json(options = nil)
      @line_items.as_json(options)
    end
  end
end
