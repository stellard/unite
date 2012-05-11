# -*- encoding : utf-8 -*-
module Unity
  module Dimension
    extend self
    
    #for a description of this algorithm refer to http://www.cs.utexas.edu/users/novak/units95.html
    
    # 0  length  meter
    # 1  time  second
    # 2  temperature   kelvin
    # 3  mass  kilogram
    # 4  current   ampere
    # 5  substance   mole
    # 6  luminosity  candela
    # 7  money   pound
    
    LIST = [:length, :time, :temperature, :mass, :current, :substance, :luminosity, :money]
    UNITS = ['meter', 'second', 'kelvin', 'kilogram', 'ampere', 'mole', 'candela', 'pound']
    INDICIES = Hash[*LIST.each_with_index{|d,i| [d,i]}.flatten]
  
    DIMSIZES =  [20, 20, 20, 10, 10, 10, 10, 10]
    DIMVALS  =  [1, 20, 400, 8000, 80000, 800000, 8000000, 80000000]
    
    def si_unit dimension
      UNITS[INDICIES[dimension.to_sym]]
    end
  
    def blank_dimension_vector
      Array.new(LIST.length, 0)
    end

  end
end

require 'units/dimension/integer'
require 'units/dimension/vector'

