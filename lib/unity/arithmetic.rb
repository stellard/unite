# -*- encoding : utf-8 -*-
module Unity
  module Arithmetic

    extend ::ActiveSupport::Concern
    include Unity::Conversion

    included do

    end

    module ClassMethods

    end

    def + other
      other = ensure_not_numeric other
      self.compatible! other
      other = other.convert_to(self) 
      self.class.new(:value => (self.value + other.value), :numerator => self.numerator, :denominator => self.denominator)
    end


    def - other
      other = ensure_not_numeric other
      self.compatible! other
      other = other.convert_to(self) 
      self.class.new(:value => (self.value - other.value), :numerator => self.numerator, :denominator => self.denominator)
    end

    def / other
      other = ensure_not_numeric other
      other = other.convert_to(self) if self.compatible? other
      self * other.inverse
    end

    def * other
      other = ensure_not_numeric other
      other = other.convert_to(self) if self.compatible? other
      new_numerator = self.numerator + other.numerator
      new_denominator = self.denominator + other.denominator
      self.class.new(:value => (self.value * other.value), :numerator => new_numerator, :denominator => new_denominator).tap(&:reduce)
    end
    
    def coerce(other)
      case other
      when Numeric
        return convert_numeric(other), self
      else
        raise TypeError, "#{self.class} can't be coerced into #{other.class}"
      end
    end

    private

    def convert_numeric other
      self.class.new :expression => other.to_s
    end

    def ensure_not_numeric other
      other.is_a?(Numeric) ? convert_numeric(other) : other
    end
  end
end
