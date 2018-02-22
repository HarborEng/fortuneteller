module FortuneTeller::Strategies
  module Debit
    class TaxSequence < FortuneTeller::Strategies::Debit::Base
      def debit!(sim:, accounts:, amount:, date:, cashflow:, tax_calculator:)
        debited = 0
        SEQUENCE.each do |tax_type|
          target_debit = amount - debited
          this_debit = 0
          debit_keys = grouped_accounts(accounts)[tax_type]

          pretax_amount = tax_calculator.calculate_pretax_amount(posttax: target_debit, tax_type: tax_type)

          cumulative = 0
          
          debit_keys.each do |k|
            sim.pass_time_account!(key: k, to: date)
            cumulative += accounts[k][:total_balance]
          end

          next if cumulative == 0

          if(pretax_amount > cumulative)
            this_debit = tax_calculator.calculate_posttax_amount(pretax: cumulative, tax_type: tax_type)
            debit_keys.each do |k|
              accounts[k][:total_balance] = 0
              accounts[k][:balances].transform_values! {|x| 0 }
            end
          else
            this_debit = target_debit
            this_debited = 0

            debit_keys.each do |k|
              v = accounts[k][:total_balance]
              # prevent over-debit
              debit = [((v.to_f/cumulative)*this_debit).round, v].min
              this_debited += debit
              sim.debit_account!(key: k, amount: debit, date: date, pass_time: false)
            end

            #with over-debit impossible, diff can only be positive
            diff = this_debit - this_debited
            if diff != 0
              debit_keys.each do |k|
                v = accounts[k][:total_balance]
                extra = [diff, v].min
                diff -= extra
                sim.debit_account!(key: k, amount: extra, date: date, pass_time: false)
                break if diff == 0
              end
            end
          end
          debited += this_debit
          cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += this_debit
          cashflow[:posttax][:total] += this_debit
        end         
      end

      private

      def grouped_accounts(accounts)
        @grouped_accounts ||= begin
          r = {
            regular: [],
            qualified: [],
            roth: []
          }
          accounts.each do |k, a|
            r[FortuneTeller::Account::Component::TAX_MAP[a[:type]]] << k
          end
          r
        end
      end

      SEQUENCE = [:regular, :qualified, :roth]
    end
  end
end


    # # :amount is posttax
    # def debit_account!(key:, amount:, date:, pass_time: true)
    #   pass_time_account!(key: key, to: date) if pass_time

    #   tax_type = FortuneTeller::Account::Component::TAX_MAP[@state[:accounts][key][:type]]
    #   start_total = @state[:accounts][key][:total_balance]

    #   pretax_amount = @current_tax_calculator.calculate_pretax_amount(posttax: amount, tax_type: tax_type)

    #   if(pretax_amount > start_total)
    #     max_amount = @current_tax_calculator.calculate_posttax_amount(pretax: amount, tax_type: tax_type)
    #     @state[:accounts][key][:total_balance] = 0
    #     @state[:accounts][key][:balances].transform_values! {|x| 0 }
    #     @current_cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += max_amount
    #     @current_cashflow[:posttax][:total] += max_amount
    #     {pretax: start_total, posttax: max_amount}
    #   else
    #     @state[:accounts][key][:total_balance] -= pretax_amount
    #     @current_cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += amount
    #     @current_cashflow[:posttax][:total] += amount

    #     balances = @state[:accounts][key][:balances]

    #     debited = 0
    #     balances.each do |k, v|
    #       # prevent over-debit
    #       debit = [((v.to_f/start_total)*pretax_amount).round, v].min
    #       debited += debit
    #       balances[k] -= debit
    #     end

    #     #with over-debit impossible, diff can only be positive
    #     diff = pretax_amount - debited 
    #     if diff != 0
    #       balances.each do |k, v|
    #         extra = [diff, v].min
    #         diff -= extra
    #         balances[k] -= extra
    #         break if diff == 0
    #       end
    #     end
    #     {pretax: pretax_amount, posttax: amount}
    #   end
    # end