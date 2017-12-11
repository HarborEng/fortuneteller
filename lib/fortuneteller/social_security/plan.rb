module FortuneTeller
  module SocialSecurity
    class Plan < FortuneTeller::Base::Plan
      def pia
        @day_plans.first.pia
      end
    end
  end
end