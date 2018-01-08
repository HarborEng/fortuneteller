module FortuneTeller
  module Base
    class Generator
      def initialize(holder:, year:)
        @holder = holder
        @year = year
      end

      def inspect
        self.class
      end

      # This avoids the time calculations involved in Date#beginning_of_month
      # for a slight speedup.
      def next_month(from)
        from.next_month.change(day: 1)
      end

      def gen_transforms(simulator:)
        (start_month(simulator)..12)
          .map{ |i| gen_transform(i) }
          .delete_if(&:nil?)
      end

      def gen_cashflows(simulator:)
        Array.new(12).map.with_index{|a, i| gen_cashflow(i)}
      end

      private

      def gen_transform(month)
        nil
      end
      
      def gen_cashflow(month)
        nil
      end

      def start_month(simulator, day=1)
        beginning = simulator.beginning 
        if @year==beginning.year          
          return (beginning.day<=day ? beginning.month : (beginning.month+1))
        else
          return 1
        end
      end
    end
  end
end