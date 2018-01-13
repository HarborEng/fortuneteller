require 'active_support/core_ext/string/inflections.rb'
require 'active_support/core_ext/module/introspection.rb'
require 'active_support/core_ext/date/calculations.rb'
require 'active_support/core_ext/object/json.rb'
require 'active_support/core_ext/object/deep_dup.rb'

require 'fortuneteller/version'
require 'fortuneteller/benchmark'

require 'fortuneteller/simulator'
require 'fortuneteller/simulation'
require 'fortuneteller/person'
require 'fortuneteller/growth_rate_set'
# require 'fortuneteller/allocation_strategy'

require 'fortuneteller/errors/plan_setup_error'

require 'fortuneteller/utils/inflating_int'
require 'fortuneteller/utils/inflating_int_cache'
require 'fortuneteller/utils/social_security'

require 'fortuneteller/strategies/allocation/none.rb'
require 'fortuneteller/strategies/allocation/annual.rb'

require 'fortuneteller/strategies/debit/base.rb'
require 'fortuneteller/strategies/debit/proportional.rb'
require 'fortuneteller/strategies/debit/tax_sequence.rb'

require 'fortuneteller/result_serializers/test'
require 'fortuneteller/result_serializers/monte_carlo'

%i[base account job social_security spending_strategy tax_strategy].each do |object_type|
  require "fortuneteller/#{object_type}/day_plan"
  require "fortuneteller/#{object_type}/component"
  require "fortuneteller/#{object_type}/plan"

  begin
    require "fortuneteller/#{object_type}/generator"
  rescue LoadError
  end

  begin
    require "fortuneteller/#{object_type}/transform"
  rescue LoadError
  end

end
require "fortuneteller/base/plan_reader"

# A personal finance simulator
module FortuneTeller
  def self.new(beginning = Date.today)
    Simulator.new(beginning)
  end
end
