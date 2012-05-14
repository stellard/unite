# -*- encoding : utf-8 -*-
require 'unite/lookup/simple_unit'
require 'unite/lookup/derived_unit'

Fabricator(:simple_unit, :class_name => "Unite::SimpleUnit") do
  si_factor 1000.0
  name 'km'
  dimension :length
end

Fabricator(:derived_unit, :class_name => "Unite::DerivedUnit") do
  name 'kWh'
end

