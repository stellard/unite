# -*- encoding : utf-8 -*-
module Unite
  class IncompatibleError < RuntimeError
  end

  module Conversion

    extend ::ActiveSupport::Concern
    include Comparison
    include SiFactor

    included do

    end

    module ClassMethods

    end

    def convert_to other
      other = cast_to_unit other
      new_value, new_numerator, new_denominator = converted(other)
      return nil if new_value.nil?
      self.class.new :value => new_value, :numerator => new_numerator, :denominator => new_denominator
    end

    def convert_to! other
      other = cast_to_unit other
      compatible! other
      new_value, new_numerator, new_denominator = converted(other)
      self.value = new_value
      self.numerator = new_numerator
      self.denominator = new_denominator
      self
    end

    protected

    def cast_to_unit other
      other = Unit.init(other.is_a?(String) ? other : other.unit)
    end

    def converted other
      new_value = self.converted_value(other)
      return [nil, nil, nil] if new_value.nil?
      return [new_value, other.numerator, other.denominator]
    end

    def converted_value other
      return nil unless self.compatible?(other)
      self.si_factor / other.si_factor
    end

  end
end

