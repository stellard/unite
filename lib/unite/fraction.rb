# -*- encoding : utf-8 -*-
module Unite
  class InvalidFormat < RuntimeError
  end

  module Fraction
    extend ::ActiveSupport::Concern

    included do

    end

    module ClassMethods

    end

    def initialize *args
      self.value ||= BigDecimal.new(0)
      self.numerator ||= []
      self.denominator ||= []
    end

    def expression= string
      self.value, self.numerator, self.denominator = parse_expression string
      reduce
      expression
    end

    def expression precision = 2
      denominator_expression.blank? ? numerator_expression(precision) : "#{numerator_expression(precision)}/#{denominator_expression}"
    end

    def unit
      unit_array_to_string self.numerator, self.denominator
    end

    def expanded_numerator
      expand_unit_array numerator
    end

    def expanded_denominator
      expand_unit_array denominator
    end

    def inverse
      new_value = value == BigDecimal.new(0) ? BigDecimal.new(0) : BigDecimal.new(1) / value
      self.class.new :value => new_value, :numerator => denominator, :denominator => numerator
    end

    def reduce
      new_unit = normalized_unit
      convert_to!(normalized_unit) unless new_unit == unit || !self.respond_to?(:convert_to!)
    end

    private

    def with_expanded_units
      expand
      result = yield
      self.numerator = reduce_unit_array(self.numerator)
      self.denominator = reduce_unit_array(self.denominator)
      result
    end

    def numerator_expression precision
      ([value.round(precision)] + (numerator || [])).join('*')
    end

    def denominator_expression
      denominator.join('*')
    end

    def expand
      self.numerator = expanded_numerator
      self.denominator = expanded_denominator
    end

    def seperate! array
      [].tap{|rejected| array.delete_if { |v| yield(v) && rejected << v }}
    end

    def split_string string
      (string.nil? ? [] : string.split('*')).map(&:strip)
    end

    def extract_value! array
      number_regex = /\A[-+]?\d*\.?\d+([eE][-+]?\d+)?\Z/
      seperate!(array){|x| number_regex =~ x }.map{|n| BigDecimal.new(n)}.
        inject(BigDecimal.new(1)){|product, number| product*number }
    end

    def reduce_unit_array array
      old_array = array.clone
      [].tap do |new_array|
        while !old_array.empty?
          unit = old_array[0]
          count = old_array.count(unit)
          old_array.delete(unit)
          count = (count == 1) ? '' : "^#{count}"
          new_array.push("#{unit}#{count}")
        end
      end
    end

    def parse_expression string
      unless string.blank? || string.strip == '/'
        num_denom = string.split('/')
        raise(InvalidFormat, string) if num_denom.length > 2 || num_denom.empty?
        top = split_string(num_denom[0])
        bottom = split_string(num_denom[1])
        value = extract_value!(top) / extract_value!(bottom)
        numerator = []
        denominator = []
        sift_units top, numerator, denominator
        sift_units bottom, denominator, numerator
      else
        value = BigDecimal.new(0)
        numerator = []
        denominator = []
      end
      return [value, numerator, denominator]
    end

    def expand_unit_array array
      array.collect  do |unit|
        if /\A([^\^\s]+)(\^(\d+))?\Z/ =~ unit
          unit = Regexp.last_match(1)
          power = Regexp.last_match(3).blank? ? 1 : Regexp.last_match(3).to_i
          Array.new(power, unit)
        else
          raise InvalidFormat, "Invalid format for Unit '#{unit}'"
        end
      end.flatten.compact
    end

    def sift_units array, top, bottom
      #move negative exponents to the bottom and keep positive on the top
      array.each do |u|
        u.match(/\A^([^\^\s]+)(\^(-?)(\d+))?\z/)
        unit = Regexp.last_match(1)
        power = Regexp.last_match(4)
        expression = "#{unit}#{power.blank? ? "": "^#{power}"}"
        if Regexp.last_match(3) == "-"
          bottom << expression
        else
          top << expression
        end
      end
      return [top, bottom]
    end

    def normalized_unit
      with_expanded_units do
        numerator_lookup_array = lookup_units numerator
        denominator_lookup_array = lookup_units denominator

        units_in_use = {}
        (numerator_lookup_array + denominator_lookup_array).each do |unit|
          dimension_int = unit.dimension_int
          units_in_use[dimension_int] ||= unit
        end

        new_numerator = normalize_units numerator_lookup_array, units_in_use
        new_denominator = normalize_units denominator_lookup_array, units_in_use


        new_denominator.delete_if do |unit|
          if nindex = new_numerator.index(unit)
            new_numerator.delete_at(nindex)
          end
        end

        new_denominator = reduce_unit_array(new_denominator)
        new_numerator = reduce_unit_array(new_numerator)

        unit_array_to_string new_numerator, new_denominator
      end
    end

    def normalize_units array, in_use_hash
      array.map { |unit| in_use_hash[unit.dimension_int] || unit }.map(&:name)
    end

    def lookup_units array
      array.map{ |unit| Lookup.find!(unit) }
    end

    def unit_array_to_string num, denom
      numertor_string = (num.blank? && !denominator.blank?) ? '1.0' : (num || []).join('*')
      denom.blank? ? numertor_string : "#{numertor_string}/#{denom.join('*')}"
    end

  end
end
