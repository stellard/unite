# -*- encoding : utf-8 -*-
module Unite
  class Property
 
    include ActiveModel::Validations
    include Dimension::Vector
    include Conversion

    attr_accessor :name, :numerator, :denominator, :value

    validates_presence_of :name
  
     def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      super
    end

  end
end
