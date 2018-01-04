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
          amount = data.amount.on(date, growth_rates: state.growth_rates) - determine_take_home_pay(state, i)
          transforms.push(gen_transform(date, amount)) if amount.positive?
        end
        transforms
      end

      private

      def gen_transform(date, amount)
        SpendingStrategy::Transform.new(
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

        c[:primary][index].fetch(:take_home_pay, 0) +
          c[:partner][index].fetch(:take_home_pay, 0)
      end
    end
  end
end
