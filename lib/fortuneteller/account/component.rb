module FortuneTeller
  module Account
    class Component < FortuneTeller::Base::Component
      TAX_MAP = {
        :brokerage    => :after_tax,
        :savings      => :after_tax,
        :checking     => :after_tax,

        :roth_ira     => :roth_retirement,
        :roth_401k    => :roth_retirement,
        :roth_403b    => :roth_retirement,

        :_401k        => :traditional_retirement,
        :ira          => :traditional_retirement,
        :_403b        => :traditional_retirement,
        :simple_ira   => :traditional_retirement,
        :sep_ira      => :traditional_retirement,
        :keogh_plan   => :traditional_retirement,
      }
    end
  end
end