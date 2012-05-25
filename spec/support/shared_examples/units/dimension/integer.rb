# -*- encoding : utf-8 -*-
shared_examples "dimension integer" do
  context "" do
    subject { described_class.new }
    describe "#dimension_int" do
      before do
        subject.stubs(:dimension_vector).returns(dimension_vector)
      end

      context "with a dimension" do 
        let(:dimension_vector) { [1,-2,0,0,0,0,0,0] }

        its(:dimension_int) { should == -39 }
      end
      context "without a dimension" do

        let(:dimension_vector) { [0,0,0,0,0,0,0,0] }

        its(:dimension_int) { should == 0 }
      end
    end

    describe "#property" do
      let(:dimension_int) { 10 } 
      let(:property_stub) { stub } 
      before do
        subject.stubs(:dimension_int => dimension_int)
        Unite::Lookup.stubs(:find_property).with(dimension_int).returns(property_stub)
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

end
