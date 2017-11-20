require 'active_support/core_ext/string/inflections.rb'
require 'active_support/core_ext/date/calculations.rb'
require 'active_support/core_ext/object/json.rb'
require 'ostruct'

require 'fortuneteller/utils/social_security'

require 'fortuneteller/version'
require 'fortuneteller/moment_struct'
require 'fortuneteller/transform_base'
require 'fortuneteller/transform_generator'

require 'fortuneteller/account'
require 'fortuneteller/cashflow'
require 'fortuneteller/inflating_int'
require 'fortuneteller/job'
require 'fortuneteller/person'
require 'fortuneteller/savings_plans'
require 'fortuneteller/simulator'
require 'fortuneteller/social_security'
require 'fortuneteller/spending_strategy'
require 'fortuneteller/state'

# A personal finance simulator
module FortuneTeller
  def self.new
    Simulator.new
  end
end
