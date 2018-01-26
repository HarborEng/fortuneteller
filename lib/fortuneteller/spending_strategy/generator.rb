module FortuneTeller
  module SpendingStrategy
    class Generator < FortuneTeller::Base::Generator
      def initialize(data:, holder:, year:)
        @data = data
        super(holder: holder, year: year)
      end
      
      private
      
      def gen_transform(month_index)
        return nil if @data[month_index].nil?
        date = Date.new(@year, (month_index+1), 1)
        self.class.parent::Transform.new(date: date, holder: @holder, data: @data[month_index])
      end
    end
  end
end
