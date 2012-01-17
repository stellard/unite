# -*- encoding : utf-8 -*-
  shared_examples "dimension vectors" do
    subject { described_class.new :expression => expression } 

    let(:expression) { "m/s^2" } 
    its(:dimension_vector) { should == [1,-2,0,0,0,0,0,0] }

    it "should limit the powers of the vector to the max"

  end
