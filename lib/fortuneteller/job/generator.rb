module FortuneTeller
  module Job
    class Generator < FortuneTeller::Base::Generator
      def initialize(data:, holder:, year:)
        @data = data
        super(holder: holder, year: year)
      end

      private
      
      def gen_transform(month_index)
        return nil if @data[month_index].nil?
        date = Date.new(@year, (month_index+1), 1)
        self.class.parent::Transform.new(date: date, holder: @holder, account_credits: @data[month_index][:account_credits])
      end

      def gen_cashflow(month_index)
        return nil if @data[month_index].nil?
        wages, matched, saved = @data[month_index][:income].values_at(:wages, :matched, :saved)
        {
          pretax_w2: (wages - saved)
        }
      end
    end
  end
end