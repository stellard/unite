# -*- encoding : utf-8 -*-
shared_examples "convertable value" do

  describe "converted unit" do
    let(:original) { described_class.new :expression => from }
    let(:final) { described_class.new :expression => to } 
    subject { original.convert_to(final) }

    context "with compatible units" do
      let(:from) { '2*km' } 
      let(:to) { 'm' }

      its(:value) { should == 2000.0 }
      its(:unit) { should == 'm' }
    end

    context "with exponents on units" do
      let(:from) { '1000000*m^2' } 
      let(:to) { 'km^2' }

      its(:value) { should == 1.0 }
      its(:unit) { should == 'km^2' }
    end

    context "with non compatible units" do
      let(:from) { '1000000*m' } 
      let(:to) { 'km^2' }
      it { should be_nil } 
    end

    context "with derived units" do
      let(:from) { '3.6e7*J' } 
      let(:to) { 'kWh' }

      its(:value) { should == 10.0 }
      its(:unit) { should == 'kWh' }
    end

    context "with value on the to" do
      let(:from) { '2*km' } 
      let(:to) { '10*m' }

      its(:value) { should == 2000.0 }
      its(:unit) { should == 'm' }
    end
  end

end
