module FortuneTeller
  module Job
    class Component < FortuneTeller::Base::Component

      def build_generators(simulator)
        reader = plan.to_reader

        (simulator.start_year..simulator.end_year).each do |year|
          data = (1..12).map do |month|
            day_plan = reader.on(Date.new(year, month, 1))
            (day_plan.nil? ? nil : day_plan.generator_data)
          end
          generators[year] = FortuneTeller::Job::Generator.new(data: data, holder: holder, year: year)
        end
      end

      private

      def gen_transforms(from:, to:, simulator:)
        # TODO: Update so it responds to changes within the year
        fields = gen_transform_fields(plan.to_reader.on(from), from)
        transforms = []
        transforms.push gen_transform(from, fields) if from.day == 1
        current = next_month(from)

        while current < to
          transforms.push gen_transform(current, fields)
          current = next_month(current)
        end

        transforms
      end
      
      def gen_transform(date, fields)
        self.class.parent::Transform.new(date: date, holder: @holder, **fields)
      end

      def gen_transform_fields(day_plan, from)
        wages = day_plan.base / 12.0
        account_credits = {}
        income = {
          wages: wages,
          saved: Utils::InflatingInt.zero,
          matched: Utils::InflatingInt.zero,
          pay_period: :monthly
        }

        day_plan.savings_plans.each do |p|
          saved = wages * (p[:percent] / 100.0)
          income[:saved] = saved + income[:saved]

          matched = wages * (p[:match] / 100.0)
          income[:matched] = matched + income[:matched]

          account_credits[p[:account].key] = { p[:holding] => saved + matched }
        end

        { account_credits: account_credits, income: income }
      end
    end
  end
end
