require "unite/version"

module Unite

end


require 'active_support'
require 'bigdecimal'

# Dir["#{Rails.root.to_s}/lib/units/**/*.rb"].each {|file| require file }
require 'unite/fraction'
require 'unite/dimension'
require 'unite/comparison'
require 'unite/conversion'
require 'unite/arithmetic'


require 'unite/lookup'

require "unite/quantity"
