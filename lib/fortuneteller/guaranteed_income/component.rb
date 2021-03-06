module FortuneTeller
  module GuaranteedIncome
    class Component < FortuneTeller::Base::Component

      def build_generators(simulator)
        reader = plan.to_reader
        day = plan.start_date.day

        simulator.years.each do |year|
          data = (1..12).map do |month|
            day_plan = reader.on(Date.new(year, month, day))
            (day_plan.nil? ? nil : day_plan.generator_data(year, month))
          end
          generators[year] = FortuneTeller::GuaranteedIncome::Generator.new(data: data, holder: holder, year: year)
        end
      end

    end
  end
end
