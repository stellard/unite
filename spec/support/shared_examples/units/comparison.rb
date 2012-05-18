# -*- encoding : utf-8 -*-
shared_examples_for "comparable unit" do
  let(:comparible1) { described_class.new :expression => expression1 }
  let(:comparible2) { described_class.new :expression => expression2 }

  describe "#compatible?" do
    subject { comparible1.compatible? comparible2 } 

    context "with compatible units" do
      let(:expression1) { "km" }
      let(:expression2) { "m" }

      it { should be_true }
    end


    context "with non compatible units" do
      let(:expression1) { "km" }
      let(:expression2) { "g" }

      it { should be_false }
    end
  end

  describe "#compatible!" do
    subject { comparible1.compatible! comparible2 } 

    context "with compatible units" do
      let(:expression1) { "km" }
      let(:expression2) { "m" }

      it { should be_true }
    end


    context "with non compatible units" do
      let(:expression1) { "km" }
      let(:expression2) { "g" }

      it "should raise exception" do
        lambda { subject }.should raise_exception Unite::IncompatibleError 
      end
    end
  end

  describe "equality  #==" do
    subject { comparible1 == comparible2 } 

    context "with comparible units" do
      let(:expression1) { "1*km" }

      context "and same value" do
        let(:expression2) { "1000*m" }
        it { should be_true }
      end

      context "and different value" do
        let(:expression2) { "1*m" }
        it { should be_false }
      end
    end

    context "with non compatible units" do
      let(:expression1) { "1*m" }
      let(:expression2) { "1*g" }
      it { should be_false } 
    end
  end


  describe "compatible_units" do
    subject { described_class.new :expression => '1*m' } 
    its(:compatible_units) { subject.map(&:to_s).should include('km', 'm') }
  end

end
