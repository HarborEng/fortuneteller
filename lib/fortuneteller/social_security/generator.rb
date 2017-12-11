module FortuneTeller
  module SocialSecurity
    class Generator < FortuneTeller::Base::Generator
      private

      def gen_transforms(from:, to:, simulator:)
        benefit = get_benefit_amount(simulator: simulator).on(from)
        transforms = []
        transforms.push gen_transform(from, benefit) if from.day == 1
        current = from.next_month.at_beginning_of_month
        while current < to
          transforms.push gen_transform(current, benefit)
          current = current.next_month.at_beginning_of_month
        end
        transforms
      end

      def gen_transform(date, benefit)
        self.class.parent::Transform.new(date: date, holder: holder, benefit: benefit)
      end

      def get_benefit_amount(simulator:)
        return @benefit unless @benefit.nil?

        if @start_date.day == 1
          start_month = @start_date
        else
          start_month = @start_date.next_month.at_beginning_of_month
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
            |j| j.plan.to_reader.on(@beginning).base
          }.sum
          puts "CURRENT SAL #{@holder} #{current_salary}"
          calc.estimate_pia(current_salary: current_salary, annual_raise: 1.03)
        end

        benefit = calc.calculate_benefit
        puts "BENEFIT #{benefit}"
        @benefit = simulator.inflating_int(benefit, start_month)
      end
    end
  end
end