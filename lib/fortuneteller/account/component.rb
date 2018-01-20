module FortuneTeller
  module Account
    class Component < FortuneTeller::Base::Component
      TAX_MAP = {
        :brokerage    => :regular,
        :savings      => :regular,
        :checking     => :regular,

        :roth_ira     => :roth,
        :roth_401k    => :roth,
        :roth_403b    => :roth,

        :_401k        => :qualified,
        :ira          => :qualified,
        :_403b        => :qualified,
        :simple_ira   => :qualified,
        :sep_ira      => :qualified,
        :keogh_plan   => :qualified,
      }
    end
  end
end