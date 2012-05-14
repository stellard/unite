# -*- encoding : utf-8 -*-

module Unite
  
  Lookup.clear!

  #SIMPLE UNITS

  #TIME
  Lookup.add SimpleUnit.new(:name => "s", :si_factor => 1, :dimension => :time)
  Lookup.add SimpleUnit.new(:name => "h", :si_factor => 3600, :dimension => :time)

  Lookup.add_property Property.new(:name => :time, :expression => 'h')

  #LENGTH
  Lookup.add SimpleUnit.new(:name => "m", :si_factor => 1, :dimension => :length)
  Lookup.add SimpleUnit.new(:name => "km", :si_factor => 1000, :dimension => :length)

  Lookup.add_property Property.new(:name => :distance, :expression => 'km')


  #MASS
  Lookup.add SimpleUnit.new(:name => "g", :si_factor => 1, :dimension => :mass)
  Lookup.add SimpleUnit.new(:name => "kg", :si_factor => 1000, :dimension => :mass)
  Lookup.add SimpleUnit.new(:name => "tonne", :si_factor => 1000000, :dimension => :mass)

  Lookup.add_property Property.new(:name => :mass, :expression => 'tonne')


  #DERIVED UNITS

  #ENERGY
  Lookup.add DerivedUnit.new(:name => "J", :expression => 'kg*m^2/s^2')
  Lookup.add DerivedUnit.new(:name => "kWh", :expression => '3.6e6*J')

  Lookup.add_property Property.new(:name => :energy, :expression => 'kWh')

  #AREA

  Lookup.add DerivedUnit.new(:name => "hectare", :expression => '10000*m^2')
  Lookup.add DerivedUnit.new(:name => "acre", :expression => '4046.85642*m^2')

  Lookup.add_property Property.new(:name => :area, :expression => 'hectare')

end




