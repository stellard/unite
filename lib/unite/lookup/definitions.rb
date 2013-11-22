# -*- encoding : utf-8 -*-

module Unite

  Lookup.clear!

  #SIMPLE UNITS

  #DIMENSIONLESS
  Lookup.add SimpleUnit.new(:name => "", :si_factor => 1, :dimension => :none)

  Lookup.add_property Property.new(:name => :none, :expression => '')

  #TIME
  Lookup.add SimpleUnit.new(:name => "s", :si_factor => 1, :dimension => :time, :aliases => ['second', 'seconds'])
  Lookup.add SimpleUnit.new(:name => "h", :si_factor => 3600, :dimension => :time, :aliases => ['hour', 'hours', 'hr'])

  Lookup.add DerivedUnit.new(:name => "day", :expression => '24*hr', :aliases => ['days'])

  Lookup.add_property Property.new(:name => :time, :expression => 'hr')

  #LENGTH
  Lookup.add SimpleUnit.new(:name => "m", :si_factor => 1, :dimension => :length, :aliases => ['meter', 'meters'])
  Lookup.add SimpleUnit.new(:name => "cm", :si_factor => 0.01, :dimension => :length)
  Lookup.add SimpleUnit.new(:name => "dm", :si_factor => 0.1, :dimension => :length)
  Lookup.add SimpleUnit.new(:name => "km", :si_factor => 1000, :dimension => :length)

  Lookup.add SimpleUnit.new(:name => "inch", :si_factor => 0.0254, :dimension => :length)
  Lookup.add DerivedUnit.new(:name => "ft", :expression => '12*inch')
  Lookup.add DerivedUnit.new(:name => "yd", :expression => '3*ft')
  Lookup.add DerivedUnit.new(:name => "mi", :expression => '1760*ft')
  Lookup.add DerivedUnit.new(:name => "NM", :expression => '1852*m')


  Lookup.add_property Property.new(:name => :distance, :expression => 'km')


  #MASS
  Lookup.add SimpleUnit.new(:name => "g", :si_factor => 1, :dimension => :mass, :aliases => ['gram'])
  Lookup.add SimpleUnit.new(:name => "kg", :si_factor => 1000, :dimension => :mass, :aliases => ['kilogram'])
  Lookup.add SimpleUnit.new(:name => "t", :si_factor => 1000000, :dimension => :mass, :aliases => ['tonne', 'metric_tonne'])

  Lookup.add SimpleUnit.new(:name => "long_ton", :si_factor => 1.01605e6, :dimension => :mass)
  Lookup.add SimpleUnit.new(:name => "short_ton", :si_factor => 907185, :dimension => :mass)
  Lookup.add SimpleUnit.new(:name => "lb", :si_factor => 453.592, :dimension => :mass)

  Lookup.add_property Property.new(:name => :mass, :expression => 'g')


  #MONEY
  Lookup.add SimpleUnit.new(:name => "GBP", :si_factor => 1, :dimension => :money)

  #Right now only one currency is supported. It is too difficult to be able to convert them.

  # Lookup.add SimpleUnit.new(:name => "EUR", :si_factor => nil, :dimension => :money)
  # Lookup.add SimpleUnit.new(:name => "USD", :si_factor => nil, :dimension => :money)
  # Lookup.add SimpleUnit.new(:name => "CAD", :si_factor => nil, :dimension => :money)

  Lookup.add_property Property.new(:name => :money, :expression => 'GBP')


  #TEMPERATURE
  Lookup.add SimpleUnit.new(:name => "K", :si_factor => 1, :dimension => :temperature, :aliases => ['kelvin'])
  Lookup.add_property Property.new(:name => :temperature, :expression => 'K')

  #LUMINOSITY
  Lookup.add SimpleUnit.new(:name => "cd", :si_factor => 1, :dimension => :luminosity, :aliases => ['candela'])
  Lookup.add_property Property.new(:name => :luminosity, :expression => 'cd')

  #CURRENT
  Lookup.add SimpleUnit.new(:name => "A", :si_factor => 1, :dimension => :current, :aliases => ['amp', 'ampere'])
  Lookup.add_property Property.new(:name => :current, :expression => 'A')

  #MOLE
  Lookup.add SimpleUnit.new(:name => "mol", :si_factor => 1, :dimension => :substance, :aliases => ['mole'])
  Lookup.add_property Property.new(:name => :substance, :expression => 'mol')


  #DERIVED UNITS

  #ENERGY
  Lookup.add DerivedUnit.new(:name => "J", :expression => 'kg*m^2/s^2')
  Lookup.add DerivedUnit.new(:name => "kWh", :expression => '3.6e6*J')

  Lookup.add DerivedUnit.new(:name => "GJ", :expression => '1e9*J')
  Lookup.add DerivedUnit.new(:name => "therm", :expression => '0.1055056*GJ')
  Lookup.add DerivedUnit.new(:name => "toe", :expression => '396.83*therm')
  Lookup.add DerivedUnit.new(:name => "kcal", :expression => '4186.8*J')

  Lookup.add_property Property.new(:name => :energy, :expression => 'kWh')

  #AREA
  Lookup.add DerivedUnit.new(:name => "square_meter", :expression => 'm^2')
  Lookup.add DerivedUnit.new(:name => "hectare", :expression => '10000*m^2')
  Lookup.add DerivedUnit.new(:name => "acre", :expression => '4046.85642*m^2')
  Lookup.add DerivedUnit.new(:name => "square_feet", :expression => 'ft^2')

  Lookup.add_property Property.new(:name => :area, :expression => 'hectare')

  #Volume
  Lookup.add DerivedUnit.new(:name => "cubic_meter", :expression => 'm^3')
  Lookup.add DerivedUnit.new(:name => "L", :expression => 'dm^3')

  Lookup.add DerivedUnit.new(:name => "cubic_feet", :expression => 'ft^3')
  Lookup.add DerivedUnit.new(:name => "gal(UK)", :expression => '4.54609*L')
  Lookup.add DerivedUnit.new(:name => "gal(US)", :expression => '231*inch^3')
  Lookup.add DerivedUnit.new(:name => "bbl", :expression => '42*gal(US)')

  Lookup.add_property Property.new(:name => :volume, :expression => 'cubic_meter')

end





