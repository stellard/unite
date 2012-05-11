# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'unity/lookup/simple_unit.rb'

describe SimpleUnit, :focus => true do
  it { should ensure_inclusion_of(:dimension).in_array(Unity::Dimension::LIST) }
  it { should validate_presence_of(:si_factor)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:dimension)}

  %w{ $ £ € m }.each do |unit|
    it "should allow valid unit #{unit}" do 
      Fabricate.build(:simple_unit, :name => unit).should be_valid
    end
  end

  %w{km^3 m/g km*tonne}.each do |unit|
    it "should not allow invalid unit #{unit}" do 
      Fabricate.build(:simple_unit, :name => unit).should_not be_valid
    end
  end

  describe "instance methods" do
    let(:dimension) { :length }
    subject { Fabricate.build :simple_unit, :name => "m", :si_factor => 1, :dimension => :length }

    its(:dimension_vector) { should == Unity::Dimension::LIST.map{|d| d == dimension ? 1 : 0}}
    its(:property_name) { should == :distance }

  end

  describe "class methods" do
    subject { SimpleUnit } 

  end

  include_examples "dimension integer"

end
