# -*- encoding : utf-8 -*-
module Unite
  module Dimension
    module Integer
      extend ::ActiveSupport::Concern

      included do
      end

      module ClassMethods

      end

      def dimension_int
        generate_dimension_integer
      end

      def property_name
        property.nil? ? nil : property.name
      end

      def property
        Lookup.find_property(dimension_int)
      end

      private

      def generate_dimension_integer
        VECTOR_LIST.length.times.inject(0){|sum, i| sum + (DIMVALS[i] * dimension_vector[i])}
      end

    end
  end
end
