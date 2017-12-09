module FortuneTeller
  module Base
    class Plan
      def initialize(&block)
        puts "IN INITIALIZE #{self.class}"
      end
    end
  end
end