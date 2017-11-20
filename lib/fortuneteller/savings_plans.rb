module FortuneTeller
  module SavingsPlans
    # Represents a savings plan based on percent of salary
    class Percent
      attr_reader :account_id, :percent, :match
      def initialize(account_id:, percent:, match: 0)
        @account_id = account_id
        @percent = percent
        @match = match
      end
    end
  end
end
