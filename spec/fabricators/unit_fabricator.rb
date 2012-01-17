# -*- encoding : utf-8 -*-
require 'unit_lookup/simple_unit'
require 'unit_lookup/derived_unit'

Fabricator(:simple_unit) do
  si_factor 1000.0
  name 'km'
  dimension :length
end

Fabricator(:derived_unit) do
  name 'kWh'
end
