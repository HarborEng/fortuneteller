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
              sim.debit_account!(key: k, amount: accounts[k][:total_balance], date: date, pass_time: false)
            end
          else
            this_debit = target_debit
            
            pretax_debited = 0

            debit_keys.each do |k|
              v = accounts[k][:total_balance]
              # prevent over-debit
              debit = [((v.to_f/cumulative)*pretax_amount).round, v].min
              pretax_debited += debit
              sim.debit_account!(key: k, amount: debit, date: date, pass_time: false)
            end

            #with over-debit impossible, diff can only be positive
            diff = pretax_amount - pretax_debited
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