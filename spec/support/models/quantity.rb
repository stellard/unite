# -*- encoding : utf-8 -*-
class Quantity

  include Units::Dimension::Vector
  include Units::Conversion
  include Units::Arithmetic

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    super
  end

  attr_accessor :name, :numerator, :denominator, :cached_expression, :value
  alias :to_s :expression

end
