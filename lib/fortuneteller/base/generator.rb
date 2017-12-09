module FortuneTeller
  module Base
    class Generator
      def initialize(holder=nil, &block)
        @holder = holder
        @plan = self.class.parent::Plan.new(&block)
      end
    end
  end
end