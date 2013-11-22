# -*- encoding : utf-8 -*-
module Unite
  class Unit

    include Dimension::Vector
    include Comparison
    include SiFactor

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      super
    end

    #Initialize the quantity,
    #
    #A nil value is treated as 0.0
    def self.init unit
      new :expression => "#{unit}"
    end

    attr_accessor :name, :numerator, :denominator, :cached_expression
    alias :to_s :expression

    def value
      @value ||= BigDecimal.new(1)
    end

    def value= x
      value
    end
  end
end
