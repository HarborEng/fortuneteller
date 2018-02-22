module FortuneTeller::Strategies
  module Debit
    class Proportional < FortuneTeller::Strategies::Debit::Base
      # Note: this is really an "even" strategy. Please forgive the temporary poor naming.
      def debit!(sim:, accounts:, amount:, date:, cashflow:, tax_calculator:)
        debited = 0
        remaining_accounts = sim.account_keys
        while debited != amount
          remaining_accounts.delete_if{|k| accounts[k][:total_balance] == 0}
          break if remaining_accounts.length == 0
          target_debit_total = amount-debited
          target_debit_each = (target_debit_total.to_f/remaining_accounts.length).floor
          target_extra = target_debit_total-(target_debit_each*remaining_accounts.length)

          remaining_accounts.each do |k|
            target_debit = target_debit_each+target_extra
            target_extra = 0

            tax_type = FortuneTeller::Account::Component::TAX_MAP[accounts[k][:type]]
            pretax_amount = tax_calculator.calculate_pretax_amount(posttax: target_debit, tax_type: tax_type)
            if pretax_amount > accounts[k][:total_balance]
              this_debit = tax_calculator.calculate_posttax_amount(pretax: accounts[k][:total_balance], tax_type: tax_type)
              this_pretax = accounts[k][:total_balance]
            else
              this_debit = target_debit
              this_pretax = pretax_amount
            end
            debited += this_debit
            sim.debit_account!(key: k, amount: this_pretax, date: date, pass_time: false)
            cashflow[:posttax]["#{tax_type}_withdrawal".to_sym] += this_debit
            cashflow[:posttax][:total] += this_debit
          end
        end
      end
    end
  end
end