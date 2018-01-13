module FortuneTeller
  class Simulation
    def self.run(**options)
      FortuneTeller::Simulation.new(**options).run
    end

    attr_accessor :account_keys
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
        @allocation_strategy.reallocate!(
          sim: self, 
          year_index: year_index, 
          accounts: @state[:accounts]
        )
        transforms.each  do |t| 
          t.apply_to!(sim: self)
        end
        pass_time_all!(to: Date.new(@current_year+1, 1, 1))
        @result.set_cashflow(year_index, @annual_cashflows[year_index])
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
        accounts: @state[:accounts]
      )
    end

    def debit_account!(key:, amount:, date:, pass_time: true)
      pass_time_account!(key: key, to: date) if pass_time

      start_total = @state[:accounts][key][:total_balance]

      # Guaranteed updates
      @state[:accounts][key][:total_balance] -= amount
      @annual_cashflows[(date.year-@start_year)][:withdrawal] += amount
      @annual_cashflows[(date.year-@start_year)][:posttax] += amount

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

    def pass_time_all!(to:)
      @account_keys.each {|k| pass_time_account!(key: k, to: to) }
      @state[:date] = to
    end

    private

    # Note: This calculation is only dependent on guaranteed_cashflows and growth_rates
    # So, cashflows can be resolved outside of the simulation if it is helpful.
    def resolve_cashflows(guaranteed_cashflows)
      @annual_cashflows = Array.new(guaranteed_cashflows.length)
      guaranteed_cashflows.map.with_index.each do |months, year_index|
        year = @start_year+year_index
        monthly_guaranteed = months.map do |month|
          if month.length == 0 
            Hash.new(0) 
          else
            reduce_cashflows(
              month
                .map do |cashflow|
                  cashflow.transform_values{ |a| inflate_year(amount: a, year: year) }
                end
            )
          end
        end
        annual_cashflow = reduce_cashflows(monthly_guaranteed)
        calculate_tax!(annual_cashflow, year_index)
        @annual_cashflows[year_index] = annual_cashflow
        monthly_guaranteed.map do |month|
          month.default = 0
          (month[:pretax_w2]*annual_cashflow[:w2_rate] + month[:pretax_ss]*annual_cashflow[:ss_rate]).round
        end
      end
    end

    def reduce_cashflows(cashflows)
      cashflows.reduce({}){|l,r| l.merge!(r){ |_k, a, b| (a + b) } }
    end

    def calculate_tax!(cashflow, year_index)
      cashflow.default = 0
      cashflow[:w2_rate] = 0.7
      cashflow[:ss_rate] = 1
      cashflow[:posttax_w2] = (cashflow[:pretax_w2]*cashflow[:w2_rate]).round
      cashflow[:posttax_ss] = (cashflow[:pretax_ss]*cashflow[:ss_rate]).round
      cashflow[:posttax] = cashflow[:posttax_w2]+cashflow[:posttax_ss]
    end
  end
end