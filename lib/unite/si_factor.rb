
# -*- encoding : utf-8 -*-
module Unite
  class IncompatibleError < RuntimeError
  end

  module SiFactor

    extend ::ActiveSupport::Concern
    include Fraction

    included do

    end

    module ClassMethods

    end

    protected

    def si_factor
      value * (get_si_factor(numerator) / get_si_factor(denominator))
    end

    def get_si_factor unit_array
      expand_unit_array(unit_array).map do |element|
        Lookup.find!(element).si_factor
      end.inject(BigDecimal.new(1)) {|product, factor| product*factor}
    end


  end
end

