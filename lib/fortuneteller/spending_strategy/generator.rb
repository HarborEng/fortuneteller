module FortuneTeller
  module SpendingStrategy
    class Generator < FortuneTeller::Base::Generator
      def resolution_transforms(state:)
        transforms = []
        reader = plan.to_reader
        12.times do |i|
          date = determine_transform_date(state, i)
          data = reader.on(date)
          next if data.nil? or data.strategy == :remainder
          amount = data.amount.on(date) - determine_take_home_pay(state, i)
          transforms.push(gen_transform(date, amount)) if amount.positive?
        end
        transforms
      end

      private

      def gen_transform(date, amount)
        self.class.parent::Transform.new(
          holder: :joint,
          date: date,
          withdrawal: amount
        )
      end

      def determine_transform_date(state, index)
        Date.new(state.from.year, (index + 1), 1)
      end

      def determine_take_home_pay(state, index)
        c = state.cashflow
        merged = state.class.cashflow_base
        merged.merge!(c[:primary][index]).merge!(c[:partner][index])
        merged.line_items[:take_home_pay]
      end
    end
  end
end