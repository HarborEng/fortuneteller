require 'active_support/core_ext/string/inflections.rb'
require 'active_support/core_ext/module/introspection.rb'
require 'active_support/core_ext/date/calculations.rb'
require 'active_support/core_ext/object/json.rb'

require 'fortuneteller/version'
require 'fortuneteller/benchmark'

require 'fortuneteller/simulator'
require 'fortuneteller/person'
require 'fortuneteller/state'
require 'fortuneteller/cashflow'
require 'fortuneteller/growth_rate_set'

require 'fortuneteller/utils/inflating_int'
require 'fortuneteller/utils/social_security'

%i[base account job social_security spending_strategy tax_strategy].each do |object_type|
  require "fortuneteller/#{object_type}/day_plan"
  require "fortuneteller/#{object_type}/generator"
  require "fortuneteller/#{object_type}/plan"
  require "fortuneteller/#{object_type}/transform" if File.exist?("lib/fortuneteller/#{object_type}/transform.rb")
  require "fortuneteller/#{object_type}/state" if File.exist?("lib/fortuneteller/#{object_type}/state.rb")
end
require "fortuneteller/base/plan_reader"

# A personal finance simulator
module FortuneTeller
  def self.new(beginning = Date.today)
    Simulator.new(beginning)
  end
end
