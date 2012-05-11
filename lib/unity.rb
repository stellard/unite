require "unity/version"

module Unity

end


require 'active_support'

# Dir["#{Rails.root.to_s}/lib/units/**/*.rb"].each {|file| require file }
require 'unity/fraction'
require 'unity/dimension'
require 'unity/comparison'
require 'unity/conversion'
require 'unity/arithmetic'


require 'unity/lookup'
