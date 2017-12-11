module FortuneTeller
  module Job
    class Generator < FortuneTeller::Base::Generator

      private

      def gen_transforms(from:, to:, simulator:)
        # TODO: Update so it responds to changes within the year
        fields = gen_transform_fields( plan.to_reader.on(from) )
        transforms = []
        transforms.push gen_transform(from, fields) if from.day == 1
        current = from.next_month.at_beginning_of_month
        while current < to
          transforms.push gen_transform(current, fields)
          current = current.next_month.at_beginning_of_month
        end
        transforms
      end
      
      def gen_transform(date, fields)
        self.class.parent::Transform.new(date: date, holder: @holder, **fields)
      end

      def gen_transform_fields(day_plan)
        wages = (day_plan.base / 12.0).floor
        account_credits = {}
        income = { wages: wages, saved: 0, matched: 0, pay_period: :monthly }
        day_plan.savings_plans.each do |p|
          s = (wages * p[:percent] / 100.0).floor
          income[:saved] += s
          m = (wages * p[:match] / 100.0).floor
          income[:matched] += m
          account_credits[p[:account].key] = s + m
        end
        { account_credits: account_credits, income: income }
      end
    end
  end
end