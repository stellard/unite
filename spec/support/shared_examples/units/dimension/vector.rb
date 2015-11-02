# -*- encoding : utf-8 -*-
shared_examples "dimension vectors" do

  describe "generating" do

  subject { described_class.new :expression => expression }

  describe "something" do

    let(:expression) { "m/s^2" }
    its(:dimension_vector) { should == [1,-2,0,0,0,0,0] }

  end


  describe "when there is no unit" do

    let(:expression) { "" }
    its(:dimension_vector) { should == [0,0,0,0,0,0,0] }

  end

  end

  it "should limit the powers of the vector to the max"

end
