module FortuneTeller
  module Account
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :type, :balance
      def set(type:, balance:)
        @type = type
        @balance = balance
      end
    end
  end
end