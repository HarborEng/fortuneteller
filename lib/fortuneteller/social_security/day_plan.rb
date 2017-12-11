module FortuneTeller
  module SocialSecurity
    class DayPlan < FortuneTeller::Base::DayPlan
      attr_reader :pia
      def start(pia: nil)
        @pia = pia
      end
    end
  end
end