# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'unity/lookup/derived_unit.rb'


describe DerivedUnit, :focus => true do
  it { should validate_presence_of(:name)}

  %w{ F J Hz N }.each do |unit|
    it "should allow valid unit #{unit}" do 
      Fabricate.build(:derived_unit, :name => unit).should be_valid
    end
  end  

  %w{km^3 m/g km*tonne}.each do |unit|
    it "should not allow invalid unit #{unit}" do 
      Fabricate.build(:derived_unit, :name => unit).should_not be_valid
    end
  end

  describe 'based off of simple units' do
    subject { DerivedUnit.new(:name => "J", :expression => 'kg*m^2/s^2') }

    its(:dimension_vector) { should == [2, -2, 0, 1, 0, 0, 0, 0] }
    its(:property_name) { should == :energy }
  end

  describe 'based off of other derived unit' do

    subject { DerivedUnit.new(:name => "kWh", :expression => '3.6e5*J') }

    its(:dimension_vector) { should == [2, -2, 0, 1, 0, 0, 0, 0] }
    its(:property_name) { should == :energy }

  end

  include_examples "comparable unit"
  include_examples "dimension integer"
  include_examples "convertable value"
  include_examples "dimension vectors"
  include_examples "unit fractions"

end

