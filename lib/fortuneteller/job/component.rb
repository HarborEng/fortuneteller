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
    end
  end
end
