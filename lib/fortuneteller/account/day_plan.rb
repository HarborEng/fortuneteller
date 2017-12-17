module FortuneTeller
  module Account
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :type, :balances
      def set(type:, balances:)
        @type = type
        @balances = balances
      end
    end
  end
end