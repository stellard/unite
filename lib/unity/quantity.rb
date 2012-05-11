# -*- encoding : utf-8 -*-
module Unity
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

    attr_accessor :name, :numerator, :denominator, :cached_expression, :value
    alias :to_s :expression

  end
end
