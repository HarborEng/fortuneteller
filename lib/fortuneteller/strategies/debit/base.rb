module FortuneTeller::Strategies
  module Debit
    class Base
      
      private

      def proportional_debit(debit_keys:, accounts:, amount:, date:, sim:)
        cumulative = 0
        debit_keys.each do |k|
          sim.pass_time_account!(key: k, to: date)
          cumulative += accounts[k][:total_balance]
        end
        
        return 0 if cumulative == 0
        
        debited = 0
        debit_keys.each do |k|
          # prevent over-debit
          debit = [
            ((accounts[k][:total_balance].to_f/cumulative)*amount).round, 
            accounts[k][:total_balance],
            amount - debited,
          ].min
          debited += debit

          sim.debit_account!(key: k, amount: debit, date: date, pass_time: false)
        end

        #with over-debit impossible, diff can only be positive
        diff = amount - debited 
        if diff != 0
          debit_keys.each do |k|
            extra = [diff, accounts[k][:total_balance]].min
            diff -= extra
            sim.debit_account!(key: k, amount: extra, date: date, pass_time: false)
            break if diff == 0
          end
        end
        debited
      end
    end
  end
end