# -*- encoding : utf-8 -*-
module Units
  class InvalidFormat < RuntimeError 
  end
  
  module Fraction
    extend ::ActiveSupport::Concern

    included do

    end

    module ClassMethods

    end

    def initialize *args
      self.value ||= 0.0
      self.numerator ||= []
      self.denominator ||= []
    end


    def expression=string
      unless string.blank?
        num_denom = string.split('/')
        raise(InvalidFormat, string) if num_denom.length > 2
        self.numerator = num_denom[0].split('*').map(&:strip)
        self.denominator = (num_denom[1].nil? ? [] : num_denom[1].split('*')).map(&:strip)
        self.value = extract_value!(:numerator) / extract_value!(:denominator)
        reduce
      else
        self.value = 0.0
        self.numerator = []
        self.denominator = []
      end
    end

    def expression
      numertor_string = ([value] + (numerator || [])).join('*')
      denominator.empty? ? numertor_string : "#{numertor_string}/#{denominator.join('*')}"
    end

    def unit
      numertor_string = (numerator.blank? && !denominator.blank?) ? '1.0' : (numerator || []).join('*')
      denominator.blank? ? numertor_string : "#{numertor_string}/#{denominator.join('*')}"
    end

    def expanded_numerator
      expand_unit_array numerator
    end

    def expanded_denominator
      expand_unit_array denominator
    end

    def inverse
      new_value = value == 0.0 ? 0.0 : 1.0 / value
      self.class.new :value => new_value, :numerator => denominator, :denominator => numerator
    end

    def reduce
      expand

      self.denominator.delete_if do |unit|  
        if nindex = self.numerator.index(unit)
          self.numerator.delete_at(nindex)
        end
      end

      self.numerator = reduce_unit_array(self.numerator)
      self.denominator = reduce_unit_array(self.denominator)

    end

    private

    def expand
      self.numerator = expanded_numerator
      self.denominator = expanded_denominator
    end

    def seperate! array
      [].tap{|rejected| array.delete_if { |v| yield(v) && rejected << v }}
    end

    def extract_value! method
      number_regex = /\A[-+]?\d*\.?\d+([eE][-+]?\d+)?\Z/
      seperate!(self.send(method)){|x| number_regex =~ x }.map(&:to_f).
        inject(1.0){|product, number| product*number }
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
  end
end
