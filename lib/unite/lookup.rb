# -*- encoding : utf-8 -*-
require 'active_model'
require 'unite/lookup/simple_unit'
require 'unite/lookup/derived_unit'
require 'unite/lookup/property'
require 'securerandom'

module Unite
  class Lookup

    class Invalid < RuntimeError
    end

    class Duplicate < RuntimeError
    end

    class Undefined < RuntimeError
    end


    class << self
      def add object
        raise Invalid, object.errors.inspect unless object.valid?

        names = [object.name] + object.aliases

        names.each do |name|
          raise Duplicate, "The Unit #{name} already exists" unless @@unit_names[name.to_sym].nil?
        end

        key = store_object object

        names.each do |name|
           @@unit_names[name.to_sym] = key
        end

        @@unit_ints[object.dimension_int] ||= []
        @@unit_ints[object.dimension_int] << key
      end

      def find! name
        key = @@unit_names[name.to_sym].tap {|k| raise Undefined, "Unit #{name} is undefined" unless k }
        get_object key
      end

      def compatible_units int_or_sym_or_string
        int =
          if int_or_sym_or_string.is_a? Integer
            int_or_sym_or_string
          else
            tmp = find_property(int_or_sym_or_string)
            tmp.nil? ? nil : tmp.dimension_int
          end
        (@@unit_ints[int] || []).map do |key|
          get_object key
        end
      end

      def find_property int_or_sym_or_string
        key =
          if int_or_sym_or_string.is_a? Integer
            @@property_ints[int_or_sym_or_string]
          else
            @@property_names[int_or_sym_or_string.to_sym]
          end.tap {|k| return nil unless k }
          get_object key
      end

      def add_property object
        raise Invalid, object.errors.inspect unless object.valid?
        existing = @@property_ints[object.dimension_int]
        raise Duplicate, "The property for dimension int #{object.dimension_int} is already defined as #{get_object(existing).name}" unless existing.nil?
        key = store_object object
        @@property_names[object.name.to_sym] = key 
        @@property_ints[object.dimension_int]= key
      end

      def property_names
        @@property_names.keys.map(&:to_sym)
      end

      def clear!
        @@object_cache = {}
        @@unit_names = Hash.new
        @@unit_ints = Hash.new
        @@property_ints = Hash.new
        @@property_names= Hash.new
      end

      def reload!
        load "#{File.dirname(__FILE__)}/lookup/definitions.rb"
      end

      private

      def store_object object
        SecureRandom.uuid.tap do |key|
          @@object_cache[key] = object
        end
      end

      def get_object key
        @@object_cache[key]
      end

    end

    clear!
    reload!

  end
end
