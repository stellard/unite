# -*- encoding : utf-8 -*-
shared_examples "dimension integer" do
  subject { described_class.new }
  describe "#dimension_int" do
    let(:dimension_vector) { [1,-2,0,0,0,0,0,0] }
    before do
      subject.stubs(:dimension_vector).returns(dimension_vector)
    end

    its(:dimension_int) { should == -39 }
  end

  describe "#property" do
    let(:dimension_int) { 10 } 
    let(:property_stub) { stub } 
    before do
      subject.stubs(:dimension_int => dimension_int)
      Unity::Lookup.stubs(:find_property).with(dimension_int).returns(property_stub)
    end    
    its(:property) { should == property_stub } 
  end

  describe "#property_name" do
    before do
      subject.stubs(:property => property_stub)
    end    
    context "with existing property"  do
      let(:property_name) { :yo } 
      let(:property_stub) { stub(:name => property_name) } 

      its(:property_name) { should == property_name } 
    end

    context "with non existing property"  do
      let(:property_stub) { nil } 

      its(:property_name) { should == nil } 
    end
  end

end
