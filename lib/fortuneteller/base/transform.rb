module FortuneTeller
  module Base
    class Transform
      attr_reader :date, :holder
      def initialize(date:, holder:)
        @date = date
        @holder = holder
      end

      def <=>(other)
        date.compare_without_coercion(other.date)
      end
    end
  end
end
