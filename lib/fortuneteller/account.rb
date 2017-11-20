module FortuneTeller
  # Representation of an account being simulated with FortuneTeller
  class Account
    attr_reader :type, :balance, :holder
    def initialize(holder:, type:, balance: 0)
      @holder = holder
      @type = type
      @balance = balance
    end

    def initial_state(start_date:)
      self.class::State.new(
        start_date: start_date,
        balance: @balance,
        account_ref: self
      )
    end

    # State object used during simulation
    class State
      attr_accessor :balance, :date
      attr_reader :account_ref
      def initialize(start_date:, balance:, account_ref:)
        @account_ref = account_ref
        @date = start_date
        @balance = balance
        @daily_growth_rate = 1.05**(1.0 / 365) # 5% annum
      end

      def credit(amount:, on:)
        pass_time(to: on)
        @balance += amount
      end

      def debit(amount:, on:)
        pass_time(to: on)
        @balance -= amount
      end

      def pass_time(to:)
        days = (to - @date).to_i
        @balance = (@balance * (@daily_growth_rate**days)).floor
        @date = to
      end

      def as_json(_options = nil)
        @balance
      end
    end
  end
end
