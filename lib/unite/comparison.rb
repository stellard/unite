# -*- encoding : utf-8 -*-
module Unite
  class IncompatibleError < RuntimeError
  end

  module Comparison

    extend ::ActiveSupport::Concern
    include Dimension::Integer

    included do

    end

    module ClassMethods

    end

    def compatible? other
      self.dimension_int == other.dimension_int
    end

    def compatible! other
      compatible?(other) ? true : raise(IncompatibleError)
    end

    def == other
      self.compatible?(other) && self.convert_to(other).value == other.value
    end

    def compatible_units
      Lookup.compatible_units self.dimension_int
    end

  end
end

