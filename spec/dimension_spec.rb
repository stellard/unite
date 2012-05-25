# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Unite::Dimension do
  subject { Unite::Dimension }


  it "should have the correct VECTOR_LIST" do
    Unite::Dimension::VECTOR_LIST.should == 
      [:length, :time, :temperature, :mass, :current, :substance, :luminosity, :money]
  end


  it "should have the correct LIST" do
    Unite::Dimension::LIST.should == 
      [:length, :time, :temperature, :mass, :current, :substance, :luminosity, :money, :none]
  end


  it "should return the correct si unit" do
    Unite::Dimension::LIST.map{|d| Unite::Dimension.si_unit(d)}.should == 
      ['meter', 'second', 'kelvin', 'kilogram', 'ampere', 'mole', 'candela', 'pound', '']
  end

  its(:blank_dimension_vector) { should == [0,0,0,0,0,0,0,0] }


end
