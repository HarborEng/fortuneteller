module FortuneTeller
  module GuaranteedIncome
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
          gty_income: benefit
        }
      end
    end
  end
end