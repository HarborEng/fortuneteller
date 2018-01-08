module FortuneTeller
  module SocialSecurity
    class Generator < FortuneTeller::Base::Generator
      def initialize(data:, holder:, year:)
        @data = data
        super(holder: holder, year: year)
      end
      
      def take_home_pay(month:)
        (@data[(month-1)].nil? ? Utils::InflatingInt.zero : @data[(month-1)])
      end

      private
      
      def gen_cashflow(month_index)
        return nil if @data[month_index].nil?
        benefit = @data[month_index]
        {
          pretax_gross: benefit,
          pretax_ss: benefit,
          pretax_adjusted: benefit,
        }
      end
    end
  end
end