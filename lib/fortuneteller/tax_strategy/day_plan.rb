module FortuneTeller
  module TaxStrategy
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :primary, :partner
      def set(primary:, partner: nil)
        @primary = primary
        @partner = partner
      end
    end
  end
end