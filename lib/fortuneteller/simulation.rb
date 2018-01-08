module FortuneTeller
  class Simulation
    def self.run(**options)
      result = FortuneTeller::Simulation.new(**options).run
      result
    end

    def initialize(initial_state:, growth_rates:, transforms:, allocation_strategy:)
      @state = initial_state
      @account_keys = @state[:accounts].keys
      @start_year = initial_state[:date].year
      @growth_rates = growth_rates
      @all_transforms = transforms
      @allocation_strategy = allocation_strategy
      @inflating_int_cache = Utils::InflatingIntCache.new(growth_rates)
    end

    def run
      result = Array.new(@all_transforms.length)
      result[0] = posterize
      @all_transforms.each_with_index do |transforms, i|
        @current_year = @start_year+i
        reallocate!
        update_daily_growth!
        # reset_cashflow!
        transforms.each  do |t| 
          t.apply_to!(sim: self)
        end
        pass_time_all!(to: Date.new(@current_year+1, 1, 1))
        result[(i+1)] = posterize
      end
      result
    end

    def apply_cashflow(cashflow:)
      # @state[:cashflow].merge!(cashflow) { |_k, a, b| (a + b) }
    end

    def credit_account(key:, amount:, date:, holding: nil)
      pass_time_account!(key: key, to: date)
      if holding.nil?
        #smart credit?
      else
        @state[:accounts][key][:balances][holding] += amount
      end
    end

    def debit(amount:, date:)
      debited = 0

      @account_keys.each do |k|
        bal = balance(key: k)

        next if bal.zero?
        pass_time_account!(key: k, to: date)
        
        account_amount = [bal, (amount - debited)].min
        next if account_amount.zero?

        debit_account(key: k, amount: account_amount, date: date, pass_time: false)
        debited += account_amount
        break if debited == amount
      end  
    end

    def inflate(amount:, date:)
      @inflating_int_cache.calculate(amount, date)
    end

    private

    def posterize
      {
        :date => @state[:date],
        :accounts => @state[:accounts].transform_values{ |a| a[:balances].values.sum }
      }
    end

    def update_daily_growth!
      @daily_growth_rates = @growth_rates.daily_all(@current_year)
    end

    def reset_cashflow!
      @state[:cashflow] = {
        pretax_gross: 0,
        pretax_salary: 0,
        pretax_savings_withdrawal: 0,
        pretax_savings: 0,
        pretax_savings_matched: 0,
        pretax_adjusted: 0,
        tax_withholding: 0,
        take_home_pay: 0
      }
    end

    def pass_time_all!(to:)
      @account_keys.each {|k| pass_time_account!(key: k, to: to) }
      @state[:date] = to
    end

    def pass_time_account!(key:, to:)
      account = @state[:accounts][key]
      if account[:date] == to
        return
      end
      days = (to - account[:date]).to_i
      account[:balances].each do |h, v|
        account[:balances][h] = (v*(@daily_growth_rates[h]**days)).round
      end
      account[:date] = to
    end

    def balance(key:)
      @state[:accounts][key][:balances].values.sum
    end

    def debit_account(key:, amount:, date:, pass_time: true)
      pass_time_account!(key: key, to: date) if pass_time

      before_balance = balance(key: key)

      balances = @state[:accounts][key][:balances]

      # Even withdrawal
      balances.transform_values! { |a| (a - ((a.to_f/before_balance)*amount).round) }

      #maybe we should ignore the rounding errors
      after_balance = balance(key: key)
      diff = (before_balance - amount - after_balance)
      if diff != 0
        balances[balances.keys.first] += diff
      end
    end

    def reallocate!
      return if @allocation_strategy.nil?
      allocation = @allocation_strategy.read_allocation(@current_year)
      return if allocation.nil?
      @account_keys.each do |k|
        total = balance(key: k).to_f
        re = allocation.each_pair.map{|i| [i[0], (total*i[1]/10000).round] }.to_h
        re.default = 0
        @state[:accounts][k][:balances] = re
      end  
    end
  end
end