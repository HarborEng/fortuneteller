module FortuneTeller
  module Base
    class Generator
      attr_accessor :plan
      def initialize(beginning=nil, holder=nil, &block)
        @holder = holder
        @plan = self.class.parent::Plan.new(beginning, &block)
      end
    end
  end
end