# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Unite::Dimension do
  subject { Unite::Dimension }


  it "should have the correct VECTOR_LIST" do
    Unite::Dimension::VECTOR_LIST.should == 
      [:length, :time, :temperature, :mass, :current, :substance, :luminosity]
  end


  it "should have the correct LIST" do
    Unite::Dimension::LIST.should == 
      [:length, :time, :temperature, :mass, :current, :substance, :luminosity, :none]
  end


  it "should return the correct si unit for dimension name" do
    Unite::Dimension::LIST.map{|d| Unite::Dimension.si_unit(d)}.should == 
      ['km', 's', 'K', 'kg', 'A', 'mol', 'cd', '']
  end

  it "should return the correct si unit for dimension index" do
    Unite::Dimension::LIST.each_with_index.map {|_,i| Unite::Dimension.si_unit(i)}.should == 
      ['km', 's', 'K', 'kg', 'A', 'mol', 'cd', '']
  end

  its(:blank_dimension_vector) { should == [0,0,0,0,0,0,0] }


end
