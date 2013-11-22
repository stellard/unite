# -*- encoding : utf-8 -*-
module Unite

  module Simplify
    extend ::ActiveSupport::Concern

    included Conversion
    included Fraction

    included do

    end

    module ClassMethods

    end

    def simplify
      new_unit = simple_unit
      convert_to!(new_unit) if new_unit && new_unit != self.unit
      self
    end

    private

    def simple_unit
       u = Lookup.compatible_units(dimension_int).first
       u ? u.name : u
    end

  end
end

