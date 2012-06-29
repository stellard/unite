# -*- encoding : utf-8 -*-

module Unite

  Lookup.clear!

  #SIMPLE UNITS

  #DIMENSIONLESS
  Lookup.add SimpleUnit.new(:name => "", :si_factor => 1, :dimension => :none)

  Lookup.add_property Property.new(:name => :none, :expression => '')

  #TIME
  Lookup.add SimpleUnit.new(:name => "s", :si_factor => 1, :dimension => :time)
  Lookup.add SimpleUnit.new(:name => "h", :si_factor => 3600, :dimension => :time)

  Lookup.add_property Property.new(:name => :time, :expression => 'h')

  #LENGTH
  Lookup.add SimpleUnit.new(:name => "m", :si_factor => 1, :dimension => :length)
  Lookup.add SimpleUnit.new(:name => "dm", :si_factor => 0.1, :dimension => :length)
  Lookup.add SimpleUnit.new(:name => "km", :si_factor => 1000, :dimension => :length)

  Lookup.add_property Property.new(:name => :distance, :expression => 'km')


  #MASS
  Lookup.add SimpleUnit.new(:name => "g", :si_factor => 1, :dimension => :mass)
  Lookup.add SimpleUnit.new(:name => "kg", :si_factor => 1000, :dimension => :mass)
  Lookup.add SimpleUnit.new(:name => "tonne", :si_factor => 1000000, :dimension => :mass)

  Lookup.add_property Property.new(:name => :mass, :expression => 'tonne')


  #DIMENSIONLESS
  Lookup.add SimpleUnit.new(:name => "GBP", :si_factor => 1, :dimension => :money)

  #Right now only one currency is supported. It is too difficult to be able to convert them.
  
  # Lookup.add SimpleUnit.new(:name => "EUR", :si_factor => nil, :dimension => :money)
  # Lookup.add SimpleUnit.new(:name => "USD", :si_factor => nil, :dimension => :money)
  # Lookup.add SimpleUnit.new(:name => "CAD", :si_factor => nil, :dimension => :money)


  Lookup.add_property Property.new(:name => :money, :expression => 'GBP')


  #DERIVED UNITS

  #ENERGY
  Lookup.add DerivedUnit.new(:name => "J", :expression => 'kg*m^2/s^2')
  Lookup.add DerivedUnit.new(:name => "kWh", :expression => '3.6e6*J')

  Lookup.add_property Property.new(:name => :energy, :expression => 'kWh')

  #AREA
  Lookup.add DerivedUnit.new(:name => "square_meter", :expression => 'm^2')
  Lookup.add DerivedUnit.new(:name => "hectare", :expression => '10000*m^2')
  Lookup.add DerivedUnit.new(:name => "acre", :expression => '4046.85642*m^2')

  Lookup.add_property Property.new(:name => :area, :expression => 'hectare')

  #Volume
  Lookup.add DerivedUnit.new(:name => "cubic_meter", :expression => 'm^3')
  Lookup.add DerivedUnit.new(:name => "L", :expression => 'dm^3')
  Lookup.add DerivedUnit.new(:name => "gallon", :expression => '3.785411784*L')

  Lookup.add_property Property.new(:name => :volume, :expression => 'cubic_meter')

end





