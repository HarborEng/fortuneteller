module FortuneTeller
  module SpendingStrategy
    class Component < FortuneTeller::Base::Component
      def build_generators(simulator)
        reader = plan.to_reader

        simulator.years.each do |year|
          data = (1..12).map do |month|
            day_plan = reader.on(Date.new(year, month, 1))
            (day_plan.nil? ? nil : day_plan.generator_data)
          end
          generators[year] = FortuneTeller::SpendingStrategy::Generator.new(data: data, holder: holder, year: year)
        end
      end
    end
  end
end
