module FortuneTeller
  module Job
    class Generator < FortuneTeller::Base::Generator
      def initialize(data:, holder:, year:)
        @data = data
        super(holder: holder, year: year)
      end

      def take_home_pay(month:)
        return Utils::InflatingInt.zero if @data[(month-1)].nil?

        d = @data[(month-1)]

        pay = (d[:income][:wages]-d[:income][:saved])
        pay -= (pay * 0.3)
      end
      
      private
      
      def gen_transform(month)
        return nil if @data[(month-1)].nil?
        date = Date.new(@year, month, 1)
        self.class.parent::Transform.new(date: date, holder: @holder, account_credits: @data[(month-1)][:account_credits])
      end

      def gen_cashflow(month_index)
        return nil if @data[month_index].nil?
        wages, matched, saved = @data[month_index][:income].values_at(:wages, :matched, :saved)
        {
          pretax_gross: (wages + matched),
          pretax_salary: wages,
          pretax_savings: saved,
          pretax_savings_matched: matched,
          pretax_adjusted: (wages - saved),
          pretax_w2: (wages - saved)
        }
      end
    end
  end
end