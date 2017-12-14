module FortuneTeller
  # Cashflows represent income streams and breakdowns. This module
  # simply provides a utility to merge two flows and sum up their
  # common streams.
  module Cashflow
    def self.merge!(left, right)
      left.merge!(right) { |_k, a, b| (a + b) }
    end
  end
end
