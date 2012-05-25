# -*- encoding : utf-8 -*-
module Unite
  class Quantity

    include Dimension::Vector
    include Conversion
    include Arithmetic

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      super
    end


    #Initialize the quantity,
    #
    #A nil value is treated as 0.0
    def self.init value, unit = ""
      new :expression => [value || 0.0, unit].reject(&:blank?).join('*')
    end

    attr_accessor :name, :numerator, :denominator, :cached_expression, :value
    alias :to_s :expression

  end
end
