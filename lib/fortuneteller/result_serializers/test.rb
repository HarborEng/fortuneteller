module FortuneTeller
  module ResultSerializers
    class Test
      def initialize(initial_state:, total_years:, sim:)
        @result = Array.new((total_years+1)) { {date: nil, accounts: nil, cashflow: nil} }
        set_accounts(0, initial_state)
        @sim = sim
      end

      def set_accounts(i, state)
        @result[i][:date] = state[:date].dup
        @result[i][:accounts] = state[:accounts].deep_dup
      end

      def set_cashflow(i, cashflow)
        @result[i][:cashflow] = cashflow.deep_dup
      end

      def output
        @result
      end
    end
  end
end