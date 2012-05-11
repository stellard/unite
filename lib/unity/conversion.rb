# -*- encoding : utf-8 -*-
module Unity
  class IncompatibleError < RuntimeError
  end

  module Conversion

    extend ::ActiveSupport::Concern
    include Unity::Comparison
    include Unity::Fraction
    
    included do

    end

    module ClassMethods

    end

    def convert_to other
      other = other.clone.tap{|o| o.value = 1.0 }  #this is so that only the unit is used for the conversion 
      new_value = self.converted_value(other)
      return nil if new_value.nil?
      self.class.new :value => new_value, :numerator => other.numerator, :denominator => other.denominator
    end

    protected 

    def converted_value other 
      return nil unless self.compatible?(other)
      self.si_factor / other.si_factor
    end

    def si_factor
      value * (get_si_factor(numerator) / get_si_factor(denominator))
    end

    def get_si_factor unit_array
      expand_unit_array(unit_array).map do |element|
          Lookup.find!(element).si_factor
      end.inject(1.0) {|product, factor| product*factor}
    end

  end
end

