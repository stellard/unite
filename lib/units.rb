# -*- encoding : utf-8 -*-
module Units
end

require 'active_support'

# Dir["#{Rails.root.to_s}/lib/units/**/*.rb"].each {|file| require file }
require 'units/fraction'
require 'units/dimension'
require 'units/comparison'
require 'units/conversion'
require 'units/arithmetic'
