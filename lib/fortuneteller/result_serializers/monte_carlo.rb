module FortuneTeller
  module ResultSerializers
    class MonteCarlo
      def initialize(initial_state:, total_years:, sim:)
        @result = Array.new((total_years+1)) { {date: nil, balance: nil, income: nil} }
        set_accounts(0, initial_state)
        @sim = sim
      end

      def set_accounts(i, state)
        @result[i][:date] = state[:date].dup
        @result[i][:balance] = state[:accounts].values.map{|a| a[:balances].values.sum }.sum
      end

      def set_cashflow(i, cashflow)
        @result[i][:income] = cashflow[:posttax]
      end

      def output
        @result
      end
    end
  end
end