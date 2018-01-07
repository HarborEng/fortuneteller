module FortuneTeller
  class AllocationStrategy
    def initialize(allocations:, start_year:)
      @start_year = start_year
      @allocations = allocations
      @allocations.each_with_index do |a, i|
        if a.nil?
          next
        elsif a.values.sum != 10000
          raise FortuneTeller::PlanSetupError.new(:allocation_unbalanced)
        end
      end
      @read_cache = {}
    end

    def reallocate(current, year)
      allocation = read_allocation(year)
      if allocation.nil?
        return current
      end
      return current if allocation.nil?
      total = current.values.sum.to_f
      re = allocation.each_pair.map{|i| [i[0], (total*i[1]/10000).round] }.to_h
      re.default = 0
      re
    end

    def read_allocation(year)
      @read_cache[year] ||= @allocations[((year - @start_year) % @allocations.size)]
    end
  end
end