module FortuneTeller::Strategies
  module Debit
    class TaxSequence < FortuneTeller::Strategies::Debit::Base
      def debit!(sim:, accounts:, amount:, date:)
        debited = 0

        sequence(accounts).each do |accounts_to_debit|
          debited += proportional_debit(
            debit_keys: accounts_to_debit,
            accounts: accounts, 
            amount: (amount-debited), 
            date: date, 
            sim: sim
          )
        end         
      end

      private

      def sequence(accounts)
        @sequence ||= begin
          s = [[], [], []]
          accounts.each do |k, a|
            s_index = SEQUENCE_MAP[FortuneTeller::Account::Component::TAX_MAP[a[:type]]]
            s[s_index] << k
          end
          s
        end
      end

      SEQUENCE_MAP = {
        :regular   => 0,
        :qualified => 1,
        :roth      => 2,
      }
    end
  end
end
