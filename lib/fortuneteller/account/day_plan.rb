module FortuneTeller
  module Account
    attr_accessor :type, :balance
    class DayPlan < FortuneTeller::Base::DayPlan
      def set(type:, balance:)
        @type = type
        @balance = balance
      end
    end
  end
end