# -*- encoding : utf-8 -*-
class Property
 
  include ActiveModel::Validations
  include Units::Dimension::Vector
  include Units::Conversion

  attr_accessor :name, :numerator, :denominator, :value

  validates_presence_of :name
  
   def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    super
  end
  
end
