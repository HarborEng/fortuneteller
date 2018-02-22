module FortuneTeller::Strategies
  module Debit
    class Base
      
      private

      def proportional_debit(debit_keys:, accounts:, amount:, date:, sim:, cashflow:)
        cumulative = 0
        debit_keys.each do |k|
          sim.pass_time_account!(key: k, to: date)
          cumulative += accounts[k][:total_balance]
        end
        
        return 0 if cumulative == 0

        debited = 0
        debits = {}
        debit_keys.each do |k|
          debits[k] = ((accounts[k][:total_balance].to_f/cumulative)*amount).floor
        end

        if debits.values.sum < amount
          diff = amount - debits.values.sum
          debit_keys.each do |k|
            if debits[k] > 0
              deduction = [diff, debits[k]].min
              debits[k] -= deduction
              diff -= deduction
            end
          end
        elsif debits.values.sum < amount
          diff = amount - debits.values.sum
          debit_keys.each do |k|

          end          
        end

        debit_keys.each do |k|
          # prevent over-debit
          debit = [
            ((accounts[k][:total_balance].to_f/cumulative)*amount).round, 
            accounts[k][:total_balance],
            amount - debited,
          ].min
          debited += debit

          sim.debit_account!(key: k, amount: debit, date: date, pass_time: false)
          tax_type = FortuneTeller::Account::Component::TAX_MAP[accounts[k][:type]]
          cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += debit
          cashflow[:posttax][:total] += debit
        end

        #with over-debit impossible, diff can only be positive
        diff = amount - debited 
        if diff != 0
          debit_keys.each do |k|
            extra = [diff, accounts[k][:total_balance]].min
            diff -= extra
            sim.debit_account!(key: k, amount: extra, date: date, pass_time: false)
            tax_type = FortuneTeller::Account::Component::TAX_MAP[accounts[k][:type]]
            cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += debit
            cashflow[:posttax][:total] += debit
            break if diff == 0
          end
        end
        debited
      end


    end
  end
end