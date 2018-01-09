module FortuneTeller
  module SocialSecurity
    class Generator < FortuneTeller::Base::Generator
      def initialize(data:, holder:, year:)
        @data = data
        super(holder: holder, year: year)
      end
      
      private
      
      def gen_cashflow(month_index)
        return nil if @data[month_index].nil?
        benefit = @data[month_index]
        {
          pretax_ss: benefit
        }
      end
    end
  end
end