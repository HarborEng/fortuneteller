module FortuneTeller
  module SocialSecurity
    class Component < FortuneTeller::Base::Component

      def build_generators(simulator)
        reader = plan.to_reader
        benefit = get_benefit_amount(simulator: simulator)

        # somewhat inefficient to look at dayplan since benefit is totally indepedent
        # but keeping this pattern for consistency and because SS in the future might 
        # have stops and starts
        simulator.years.each do |year|
          data = (1..12).map do |month|
            day_plan = reader.on(Date.new(year, month, 1))
            (day_plan.nil? ? nil : benefit)
          end
          generators[year] = FortuneTeller::SocialSecurity::Generator.new(data: data, holder: holder, year: year)
        end
      end

      private

      def get_benefit_amount(simulator:)
        @benefit ||= begin
          if @start_date.day == 1
            start_month = @start_date
          else
            start_month = next_month(@start_date)
          end

          calc = FortuneTeller::Utils::SocialSecurity.new(dob: simulator.send(@holder).birthday)

          if not plan.pia.nil?
            # calc.fra_pia = plan.pia
            benefit = calc.calculate_benefit(
              fra_pia: plan.pia,
              start_month: start_month
            )
          else
            current_salary = simulator.jobs.values.keep_if { 
              |j| j.holder==@holder 
            }.map{ 
              |j| j.plan.to_reader.on(@beginning).base.initial_value
            }.sum
            puts "CURRENT SAL #{@holder} #{current_salary}" if ENV['VERBOSE']
            
            salary_data = calc.build_salary_data(
              current_salary: current_salary,
              annual_raise: 1.03,
            )
            benefit = calc.calculate_benefit(
              salary_data: salary_data,
              start_month: start_month
            )
          end

          puts "BENEFIT #{benefit}" if ENV['VERBOSE']

          Utils::InflatingInt.new(
            int: benefit,
            start_date: start_month,
            growth_key: :inflation
          )
        end
      end
    end
  end
end
