module FortuneTeller
  module SocialSecurity
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_accessor :base, :savings_plans

      def start(pia:)
        @pia = pia
      end
    end
  end
end