# -*- encoding : utf-8 -*-
require 'unity/lookup/simple_unit'
require 'unity/lookup/derived_unit'

Fabricator(:simple_unit) do
  si_factor 1000.0
  name 'km'
  dimension :length
end

Fabricator(:derived_unit) do
  name 'kWh'
end
