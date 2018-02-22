module FortuneTeller
  class Simulation
    def self.run(**options)
      FortuneTeller::Simulation.new(**options).run
    end

    attr_accessor :account_keys
    attr_reader :start_year, :growth_rates

    def initialize(
        result_serializer:, 
        initial_state:, 
        growth_rates:, 
        transforms:, 
        guaranteed_cashflows:, 
        allocation_strategy:,
        debit_strategy:
      )
      @state = initial_state.deep_dup
      @account_keys = @state[:accounts].keys
      @start_year = initial_state[:date].year
      @growth_rates = growth_rates
      @all_transforms = transforms
      @allocation_strategy = allocation_strategy
      @debit_strategy = debit_strategy
      @cumulative_cache = {}
      @inflating_int_cache = Utils::InflatingIntCache.new(growth_rates)
      @guaranteed_take_homes = resolve_cashflows(guaranteed_cashflows)
      @result_serializer = result_serializer
      @instance_variables = {}
    end

    def guaranteed_take_home(year, month)
      @guaranteed_take_homes[(year-@start_year)][(month-1)]
    end

    def run
      @result = @result_serializer.new(
        initial_state: @state, 
        total_years: @all_transforms.length,
        sim: self
      )
      @all_transforms.each_with_index do |transforms, year_index|
        @current_year = @start_year+year_index
        @current_tax_calculator = @tax_calculators[year_index]
        @current_cashflow = @annual_cashflows[year_index]
        @allocation_strategy.reallocate!(
          sim: self, 
          year_index: year_index, 
          accounts: @state[:accounts]
        )
        transforms.each  do |t| 
          t.apply_to!(sim: self)
        end
        pass_time_all!(to: Date.new(@current_year+1, 1, 1))
        @result.set_cashflow(year_index, @current_cashflow)
        @result.set_accounts((year_index+1), @state)
      end
      @result.output
    end

    def credit_account!(key:, amount:, date:, holding: nil)
      pass_time_account!(key: key, to: date)
      if holding.nil?
        #smart credit?
      else
        @state[:accounts][key][:balances][holding] += amount
        @state[:accounts][key][:total_balance] += amount
      end
    end

    def inflate(amount:, date:)
      @inflating_int_cache.calculate(amount, date)
    end

    def deflate(amount:, year_index:)
      factor = @growth_rates.cumulative(:inflation, @start_year, @start_year + year_index)
      amount / factor
    end

    def inflate_year(amount:, year:)
      @inflating_int_cache.calculate_year(amount, year)
    end

    def balance(key:)
      @state[:accounts][key][:total_balance]
    end

    def pass_time_account!(key:, to:)
      account = @state[:accounts][key]
      if account[:date] == to
        return
      end
      days = (to - account[:date]).to_i
      new_total = 0
      account[:balances].each do |h, v|
        new_v = (v*(@growth_rates.daily(h, @current_year)**days)).round
        account[:balances][h] = new_v
        new_total += new_v
      end
      account[:date] = to
      account[:total_balance] = new_total
    end

    def debit!(amount:, date:)
      @debit_strategy.debit!(
        amount: amount,
        date: date,
        sim: self,
        accounts: @state[:accounts],
        cashflow: @current_cashflow,
        tax_calculator: @current_tax_calculator
      )
    end

    def debit_account!(key:, amount:, date:, pass_time: true)
      raise ArgumentError, "cannot debit negative amount #{amount} on #{date} to #{key}" if amount < 0
      pass_time_account!(key: key, to: date) if pass_time

      start_total = @state[:accounts][key][:total_balance]

      # Guaranteed updates
      @state[:accounts][key][:total_balance] -= amount

      # Figure out balances
      if(@state[:accounts][key][:total_balance]==0)
        @state[:accounts][key][:balances].transform_values! {|x| 0 }
      else
        balances = @state[:accounts][key][:balances]

        debited = 0
        balances.each do |k, v|
          # prevent over-debit
          debit = [((v.to_f/start_total)*amount).round, v].min
          debited += debit
          balances[k] -= debit
        end

        #with over-debit impossible, diff can only be positive
        diff = amount - debited 
        if diff != 0
          balances.each do |k, v|
            extra = [diff, v].min
            diff -= extra
            balances[k] -= extra
            break if diff == 0
          end
        end
      end
    end

    # :amount is posttax
    def debit_account_dead!(key:, amount:, date:, pass_time: true)
      pass_time_account!(key: key, to: date) if pass_time

      tax_type = FortuneTeller::Account::Component::TAX_MAP[@state[:accounts][key][:type]]
      start_total = @state[:accounts][key][:total_balance]

      pretax_amount = @current_tax_calculator.calculate_pretax_amount(posttax: amount, tax_type: tax_type)

      if(pretax_amount > start_total)
        max_amount = @current_tax_calculator.calculate_posttax_amount(pretax: amount, tax_type: tax_type)
        @state[:accounts][key][:total_balance] = 0
        @state[:accounts][key][:balances].transform_values! {|x| 0 }
        @current_cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += max_amount
        @current_cashflow[:posttax][:total] += max_amount
        {pretax: start_total, posttax: max_amount}
      else
        @state[:accounts][key][:total_balance] -= pretax_amount
        @current_cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += amount
        @current_cashflow[:posttax][:total] += amount

        balances = @state[:accounts][key][:balances]

        debited = 0
        balances.each do |k, v|
          # prevent over-debit
          debit = [((v.to_f/start_total)*pretax_amount).round, v].min
          debited += debit
          balances[k] -= debit
        end

        #with over-debit impossible, diff can only be positive
        diff = pretax_amount - debited 
        if diff != 0
          balances.each do |k, v|
            extra = [diff, v].min
            diff -= extra
            balances[k] -= extra
            break if diff == 0
          end
        end
        {pretax: pretax_amount, posttax: amount}
      end
    end

    def pass_time_all!(to:)
      @account_keys.each {|k| pass_time_account!(key: k, to: to) }
      @state[:date] = to
    end

    def instance_get(key)
      @instance_variables[key]
    end
    def instance_set(key, value)
      @instance_variables[key] = value
    end

    private

    # Note: This calculation is only dependent on guaranteed_cashflows and growth_rates
    # So, cashflows can be resolved outside of the simulation if it is helpful.
    def resolve_cashflows(guaranteed_cashflows)
      tax_brackets = FortuneTeller::Utils::TAX_BRACKETS_2017_Q3
      @tax_calculators = Array.new(guaranteed_cashflows.length)
      @annual_cashflows = {
        pretax: Array.new(guaranteed_cashflows.length),
        posttax: Array.new(guaranteed_cashflows.length),
      }
      guaranteed_cashflows.map.with_index.each do |months, year_index|
        year = @start_year+year_index
        monthly_guaranteed = months.map do |month|
          if month.length == 0 
            Hash.new(0) 
          else
            reduce_cashflows(
              month
                .map do |cashflow|
                  cashflow.transform_values{ |a| (a.is_a?(Integer) ? a : inflate_year(amount: a, year: year)) }
                end
            )
          end
        end
        year_cashflow = {}
        year_cashflow[:pretax] = reduce_cashflows(monthly_guaranteed)
        tax_calculator = FortuneTeller::Utils::TaxCalculator.new(
          bracket_lib: tax_brackets, 
          state: :florida, #Hardcode state with no income tax until simulator can handle state
          filing_status: :single, #TODO: Resolve
          inflation: @growth_rates.cumulative(:inflation, @start_year, year)
        )
        tax_calculator.set_pretax(year_cashflow[:pretax])
        year_cashflow[:posttax] = tax_calculator.calculate_posttax
        @tax_calculators[year_index] = tax_calculator

        @annual_cashflows[year_index] = year_cashflow

        monthly_guaranteed.map do |month|
          total = 0
          month.each do |k, v|
            next if v.zero?

            total += (v.to_f * year_cashflow[:posttax][k]/year_cashflow[:pretax][k]).round
          end
          total
        end
      end
    end

    def reduce_cashflows(cashflows)
      cashflows.reduce({}){|l,r| l.merge!(r){ |_k, a, b| (a + b) } }
    end
  end
end