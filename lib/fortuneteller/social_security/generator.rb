module FortuneTeller
  module SocialSecurity
    class Generator < FortuneTeller::Base::Generator
      def initialize(data:, holder:, year:)
        @data = data
        super(holder: holder, year: year)
      end

      def gen_transforms(simulator:)
        (start_month(simulator)..12)
          .map{ |i| gen_transform(i) }
          .delete_if(&:nil?)
      end
      
      private
      
      def gen_transform(month)
        return nil if @data[(month-1)].nil?
        date = Date.new(@year, month, 1)
        self.class.parent::Transform.new(date: date, holder: @holder, benefit: @data[(month-1)])
      end
    end
  end
end