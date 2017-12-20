module FortuneTeller
  # We extend `state` Hash with this module for readability
  class State
    attr_reader :date, :accounts, :cashflow, :from, :to, :growth_rates

    def self.cashflow_base
      {
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

    def initialize(start_date:, growth_rates:, previous: nil)
      @from = start_date.dup
      @date = start_date
      @growth_rates = growth_rates
      @accounts = {}
      unless previous.nil?
        previous.accounts.each { |k, a| @accounts[k] = a.dup }
      end
      @cashflow = {
        primary: Array.new(12) { self.class.cashflow_base },
        partner: Array.new(12) { self.class.cashflow_base }
      }
      @inflating_int_cache = Utils::InflatingIntCache.new(growth_rates)
    end

    def add_account(key:, account:, growth_rates:)
      @accounts[key] = account.initial_state(start_date: @date, growth_rates: @growth_rates)
    end

    def pass_time(to:)
      @date = @to = to
      @accounts.each_value { |a| a.pass_time(to: to) }
    end

    def apply_pretax_savings_withdrawal(date:, holder:, amount:, source:)
      @accounts[source].debit(amount: amount, on: date, pass_time: false)
      c = {
        pretax_gross: amount,
        pretax_savings_withdrawal: amount,
        pretax_adjusted: amount,
        tax_withholding: 0,
        take_home_pay: amount
      }

      apply_cashflow(date: date, holder: holder, cashflow: c)
    end

    def apply_w2_income(date:, holder:, income:, account_credits:)
      c = generate_w2_cashflow(date, income)
      apply_cashflow(date: date, holder: holder, cashflow: c)
      account_credits.each do |k, allocations|
        allocations.each do |holding, amount|
          grown_amount = @inflating_int_cache.calculate(amount, date)
          @accounts[k].credit(amount: grown_amount, on: date, holding: holding)
        end
      end
    end

    def apply_ss_income(date:, holder:, income:)
      c = generate_ss_cashflow(date, income)
      apply_cashflow(date: date, holder: holder, cashflow: c)
    end

    def init_next
      self.class.new(
        start_date: @date,
        growth_rates: @growth_rates,
        previous: self
      )
    end

    def merged_cashflow(holder:)
      @cashflow[holder].reduce({}, Cashflow.method(:merge!))
    end

    def as_json(_options = nil)
      {
        date: @date,
        # cashflow: {
        #   primary: merged_cashflow(holder: :primary).as_json(options),
        #   partner: merged_cashflow(holder: :partner).as_json(options)
        # },
        accounts: @accounts.as_json
      }
    end

    private

    def generate_w2_cashflow(date, income)
      wages, matched, saved = income.values_at(:wages, :matched, :saved).map do |i|
        @inflating_int_cache.calculate(i, date)
      end

      c = {
        pretax_gross: (wages + matched),
        pretax_salary: wages,
        pretax_savings: saved,
        pretax_savings_matched: matched,
        pretax_adjusted: (wages - saved)
      }
      c[:tax_withholding] = calculate_w2_withholding(
        date: date,
        adjusted_income: c[:pretax_adjusted],
        pay_period: income[:pay_period]
      )
      c[:take_home_pay] = c[:pretax_adjusted] - c[:tax_withholding]
      c
    end

    def generate_ss_cashflow(date, income)
      benefit = @inflating_int_cache.calculate(income[:ss], date)

      {
        pretax_gross: benefit,
        pretax_ss: benefit,
        pretax_adjusted: benefit,
        tax_withholding: 0,
        take_home_pay: benefit
      }
    end

    def calculate_w2_withholding(date:, adjusted_income:, pay_period:)
      # Ideally, use state to determine w-4 allowances
      (adjusted_income * 0.3).floor
    end

    def apply_cashflow(date:, holder:, cashflow:)
      Cashflow.merge!(@cashflow[holder][(date.month - 1)], cashflow)
    end
  end
end
