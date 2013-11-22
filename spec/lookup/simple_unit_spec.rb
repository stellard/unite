# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'unite/lookup/simple_unit.rb'

module Unite
  describe SimpleUnit do
    it { should ensure_inclusion_of(:dimension).in_array(Dimension::LIST) }
    it { should validate_presence_of(:si_factor)}
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

    describe "no dimension" do
      subject { SimpleUnit.new(:name => "", :si_factor => 1, :dimension => :none) }

      it { should be_valid }
      its(:property_name) { should == :none } 

    end

    describe "instance methods" do
      let(:dimension) { :length }
      subject { Fabricate.build :simple_unit, :name => "m", :si_factor => 1, :dimension => :length }
      its(:dimension_vector) { should == Dimension::VECTOR_LIST.map{|d| d == dimension ? 1 : 0}}
      its(:property_name) { should == :distance }
    end

    describe "class methods" do
      subject { SimpleUnit } 

    end

    include_examples "dimension integer"

  end
end
