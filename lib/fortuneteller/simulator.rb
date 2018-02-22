module FortuneTeller
  # Simulates personal finances.
  class Simulator
    OBJECT_TYPES = %i[account job social_security guaranteed_income spending_strategy tax_strategy]
    USER_TYPES = %i[primary partner]
    STRATEGIES = %i[allocation debit]

    attr_reader :beginning

    USER_TYPES.each do |user_type|
      attr_reader user_type
      define_method :"add_#{user_type}" do |**kwargs|
        raise FortuneTeller::PlanSetupError.new(:plan_finalized) if @finalized
        instance_variable_set(
          :"@#{user_type}", 
          FortuneTeller::Person.new(**kwargs)
        )
      end
    end

    OBJECT_TYPES.each do |object_type|
      attr_reader object_type.to_s.pluralize.to_sym
      define_method :"add_#{object_type}" do |holder=nil, &block|
        raise FortuneTeller::PlanSetupError.new(:plan_finalized) if @finalized
        component = "fortune_teller/#{object_type}/component".classify.constantize
        key = @available_keys.shift
        obj = component.new(key, @beginning, holder, &block)
        collection = send(object_type.to_s.pluralize.to_sym)[key] = obj
        obj
      end
    end

    STRATEGIES.each do |strategy|
      attr_reader "#{strategy}_strategy".to_sym
      define_method :"set_#{strategy}_strategy" do |s, *args|
        raise FortuneTeller::PlanSetupError.new(:plan_finalized) if @finalized
        instance_variable_set(
          :"@#{strategy}_strategy",
          "fortune_teller/strategies/#{strategy}/#{s}".classify.constantize.new(*args)
        )
      end
    end

    def initialize(beginning, end_age=100)
      @beginning = beginning
      @end_age = end_age
      @available_keys = ('AA'..'ZZ').to_a
      @finalized = false
      OBJECT_TYPES.each do |object_type|
        send("#{object_type.to_s.pluralize}=".to_sym, {})
      end
      set_allocation_strategy(:none)
      set_debit_strategy(:proportional)
    end

    def initial_take_home_pay
      jobs.values.map do |job|
        plan = job.plan.to_reader.on(@beginning)
        monthly_base = (plan.base.initial_value / 12.0).round
        plan.savings_plans.each do |savings|
          monthly_base -= (savings[:percent]/100.0 * monthly_base).round
        end
        (FortuneTeller::Utils::TaxCalculator::FLAT[:w2] * monthly_base).round
      end.sum.round
    end

    def all_transforms
      @all_transforms ||= years.map { |year| year_transforms(year) }
    end

    def all_guaranteed_cashflows
      @all_guaranteed_cashflows ||= years.map { |year| year_guaranteed_cashflows(year) }
    end

    def simulate(growth_rates:, result_serializer: FortuneTeller::ResultSerializers::Test)
      finalize_plan! unless @finalized
      growth_rates = GrowthRateSet.new(growth_rates, start_year: @beginning.year)
      FortuneTeller::Simulation.run(
        growth_rates: growth_rates,
        initial_state: initial_state,
        transforms: all_transforms,
        guaranteed_cashflows: all_guaranteed_cashflows,
        allocation_strategy: @allocation_strategy,
        debit_strategy: @debit_strategy,
        result_serializer: result_serializer
      )
    end

    def start_year
      beginning.year
    end

    def end_year
      @end_year
    end

    def years
      (start_year..end_year)
    end

    private

    OBJECT_TYPES.each do |object_type|
      attr_writer object_type.to_s.pluralize.to_sym
    end

    def finalize_plan!
      validate_plan!

      #finalize end_date
      @end_year = oldest_birthday.year + @end_age

      plan_components.each do |c|
        c.build_generators(self)
      end

      @finalized = true
    end

    # Note: there is a potential efficiency boost for couples by merging InflatingInts of the
    # same key before returning.  That may result in some rounding errors in the tests.
    def year_guaranteed_cashflows(year)
      guaranteed_cashflow_components
        .map{ |c| c.generators[year].gen_cashflows }
        .transpose
        .map { |month| month.delete_if(&:nil?) }
    end

    def guaranteed_cashflow_components
      @guaranteed_cashflow_components ||=
        %i[job social_security guaranteed_income].map do |object_type|
          send(object_type.to_s.pluralize.to_sym)
        end
        .flat_map(&:values)
    end

    def year_transforms(year)
      plan_components
        .flat_map do |component|
          component.generators[year].gen_transforms
        end
        .sort
    end

    def plan_components
      @plan_components ||=
        %i[job social_security guaranteed_income spending_strategy].map do |object_type|
          send(object_type.to_s.pluralize.to_sym)
        end
        .flat_map(&:values)
    end

    def oldest_birthday
      return @primary.birthday if no_partner?
      [@primary.birthday, @partner.birthday].max
    end

    def strategies
      FortuneTeller::Strategies
    end

    def initial_state
      @initial_state ||= begin
        accounts_state = accounts.transform_values do |a| 
          r = a.plan.to_reader.on(@beginning)
          {
            date: @beginning,
            total_balance: r.balances.values.sum,
            type: r.type,
            balances: r.balances.dup
          }
        end
        {
          date: @beginning,
          accounts: accounts_state
        }
      end
    end

    def no_partner?
      @partner.nil?
    end

    def no_primary?
      @primary.nil?
    end

    def validate_plan!
      if no_primary? and no_partner?
        raise setup_error(:no_person)
      elsif no_primary?
        raise setup_error(:no_primary_person)
      end
    end

    def setup_error(token)
      FortuneTeller::PlanSetupError.new(token)
    end
  end
end
