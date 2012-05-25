require "unite/version"

module Unite

end


require 'active_support'
require 'bigdecimal'

class BigDecimal

  alias :old_to_s :to_s
  def to_s format = 'F'
    self.old_to_s(format)
  end

end


# Dir["#{Rails.root.to_s}/lib/units/**/*.rb"].each {|file| require file }
require 'unite/fraction'
require 'unite/dimension'
require 'unite/comparison'
require 'unite/conversion'
require 'unite/arithmetic'


require 'unite/lookup'

require "unite/quantity"
