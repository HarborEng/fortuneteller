module FortuneTeller::Strategies
  module Allocation
    class Annual
      def initialize(allocations)
        @allocations = allocations
        @allocations.values.transpose.each do |full|
          if full.sum != 10000
            raise FortuneTeller::PlanSetupError.new(:allocation_unbalanced)
          end
        end
        @read_cache = {}
      end

      def reallocate!(sim:, year_index:, accounts:)
        allocation = read_allocation(year_index)
        accounts.keys.each do |k|
          total = sim.balance(key: k).to_f
          re = allocation.each_pair.map{|i| [i[0], (total*i[1]/10000).round] }.to_h
          re.default = 0
          accounts[k][:balances] = re
        end  
      end

      def read_allocation(year_index)
        @read_cache[year_index] ||= @allocations.transform_values{|a| a[(year_index % a.length)]}
      end
    end
  end
end