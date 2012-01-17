# -*- encoding : utf-8 -*-
module Units
  module Dimension
    module Vector
      extend ::ActiveSupport::Concern
      include Units::Fraction

      included do
      end

      module ClassMethods
      
      end  

      def dimension_vector
        generate_dimension_vector
      end

      private
    
      def generate_dimension_vector
        subtract_vectors numerator_dimension_vector, denominator_dimension_vector
      end

      def numerator_dimension_vector
        self.expanded_numerator.inject(Dimension.blank_dimension_vector){|v, unit| add_vectors(v, UnitLookup.find!(unit).dimension_vector) }
      end

      def denominator_dimension_vector
        self.expanded_denominator.inject(Dimension.blank_dimension_vector){|v, unit| add_vectors(v, UnitLookup.find!(unit).dimension_vector) }
      end

      def add_vectors v1, v2
        LIST.length.times.map{|i| v1[i] + v2[i]}
      end

      def subtract_vectors v1, v2
        LIST.length.times.map{|i| v1[i] - v2[i]}
      end
      
    end
  end
end
