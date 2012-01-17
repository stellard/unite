# -*- encoding : utf-8 -*-
# This file is copied to spec/ when you run 'rails generate rspec:install'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'mocha'
require 'units'
require 'unit_lookup'
require 'fabrication'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

  config.mock_with :mocha

  config.before(:each) do
  end

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
