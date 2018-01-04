module FortuneTeller
  module SocialSecurity
    class Generator < FortuneTeller::Base::Generator
      private

      def gen_transforms(from:, to:, simulator:)
        benefit = get_benefit_amount(simulator: simulator)
        transforms = []
        transforms.push gen_transform(from, benefit) if from.day == 1
        current = next_month(from)
        while current < to
          transforms.push gen_transform(current, benefit)
          current = next_month(current)
        end
        transforms
      end

      def gen_transform(date, benefit)
        self.class.parent::Transform.new(date: date, holder: holder, benefit: benefit)
      end

      def get_benefit_amount(simulator:)
        @benefit ||= begin
          if @start_date.day == 1
            start_month = @start_date
          else
            start_month = next_month(@start_date)
          end

          calc = FortuneTeller::Utils::SocialSecurity.new(
            dob: simulator.send(@holder).birthday,
            start_month: start_month
          )

          if not plan.pia.nil?
            calc.fra_pia = plan.pia
          else
            current_salary = simulator.jobs.values.keep_if { 
              |j| j.holder==@holder 
            }.map{ 
              |j| j.plan.to_reader.on(@beginning).base.initial_value
            }.sum
            puts "CURRENT SAL #{@holder} #{current_salary}" if ENV['VERBOSE']
            calc.estimate_pia(current_salary: current_salary, annual_raise: 1.03)
          end

          benefit = calc.calculate_benefit
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
