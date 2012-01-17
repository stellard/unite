# -*- encoding : utf-8 -*-
UnitLookup.clear!



#SIMPLE UNITS

#TIME
UnitLookup.add SimpleUnit.new(:name => "s", :si_factor => 1, :dimension => :time)
UnitLookup.add SimpleUnit.new(:name => "h", :si_factor => 3600, :dimension => :time)

UnitLookup.add_property Property.new(:name => :time, :expression => 'h')

#LENGTH
UnitLookup.add SimpleUnit.new(:name => "m", :si_factor => 1, :dimension => :length)
UnitLookup.add SimpleUnit.new(:name => "km", :si_factor => 1000, :dimension => :length)

UnitLookup.add_property Property.new(:name => :distance, :expression => 'km')


#MASS
UnitLookup.add SimpleUnit.new(:name => "g", :si_factor => 1, :dimension => :mass)
UnitLookup.add SimpleUnit.new(:name => "kg", :si_factor => 1000, :dimension => :mass)
UnitLookup.add SimpleUnit.new(:name => "tonne", :si_factor => 1000000, :dimension => :mass)

UnitLookup.add_property Property.new(:name => :mass, :expression => 'tonne')


#DERIVED UNITS

#ENERGY
UnitLookup.add DerivedUnit.new(:name => "J", :expression => 'kg*m^2/s^2')
UnitLookup.add DerivedUnit.new(:name => "kWh", :expression => '3.6e6*J')

UnitLookup.add_property Property.new(:name => :energy, :expression => 'kWh')

#AREA

UnitLookup.add DerivedUnit.new(:name => "hectare", :expression => '10000*m^2')
UnitLookup.add DerivedUnit.new(:name => "acre", :expression => '4046.85642*m^2')

UnitLookup.add_property Property.new(:name => :area, :expression => 'hectare')





