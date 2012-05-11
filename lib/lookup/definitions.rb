# -*- encoding : utf-8 -*-
Unity::Lookup.clear!



#SIMPLE UNITS

#TIME
Unity::Lookup.add SimpleUnit.new(:name => "s", :si_factor => 1, :dimension => :time)
Unity::Lookup.add SimpleUnit.new(:name => "h", :si_factor => 3600, :dimension => :time)

Unity::Lookup.add_property Property.new(:name => :time, :expression => 'h')

#LENGTH
Unity::Lookup.add SimpleUnit.new(:name => "m", :si_factor => 1, :dimension => :length)
Unity::Lookup.add SimpleUnit.new(:name => "km", :si_factor => 1000, :dimension => :length)

Unity::Lookup.add_property Property.new(:name => :distance, :expression => 'km')


#MASS
Unity::Lookup.add SimpleUnit.new(:name => "g", :si_factor => 1, :dimension => :mass)
Unity::Lookup.add SimpleUnit.new(:name => "kg", :si_factor => 1000, :dimension => :mass)
Unity::Lookup.add SimpleUnit.new(:name => "tonne", :si_factor => 1000000, :dimension => :mass)

Unity::Lookup.add_property Property.new(:name => :mass, :expression => 'tonne')


#DERIVED UNITS

#ENERGY
Unity::Lookup.add DerivedUnit.new(:name => "J", :expression => 'kg*m^2/s^2')
Unity::Lookup.add DerivedUnit.new(:name => "kWh", :expression => '3.6e6*J')

Unity::Lookup.add_property Property.new(:name => :energy, :expression => 'kWh')

#AREA

Unity::Lookup.add DerivedUnit.new(:name => "hectare", :expression => '10000*m^2')
Unity::Lookup.add DerivedUnit.new(:name => "acre", :expression => '4046.85642*m^2')

Unity::Lookup.add_property Property.new(:name => :area, :expression => 'hectare')





