# -*- encoding : utf-8 -*-
shared_examples_for "unit fractions" do
  context "fractions" do

    subject { described_class.new :expression => expression }

    describe "required methods" do
      subject {  described_class.new }
      it { should respond_to(:value) } 
      it { should respond_to(:value=) } 
      it { should respond_to(:numerator) } 
      it { should respond_to(:numerator=) } 
      it { should respond_to(:denominator=) } 
      it { should respond_to(:denominator=) } 
    end

    describe "#expression" do

      context "with blank string" do
        let(:expression) { '' }

        its(:unit) { should == '' }
        its(:value) { should == 0.0 }
        its(:expression) { '0.0' }
      end

      context "with number only" do
        let(:expression) { '5.7' }

        its(:unit) { should == '' }
        its(:value) { should == 5.7 }
        its(:expression) { should == '5.7' } 
      end

      context "with number and unit" do
        let(:expression) { '10*m/5*s^2' }

        its(:unit) { should == 'm/s^2' }
        its(:value) { should == 2.0 }
        its(:expression) { should == '2.0*m/s^2' } 
      end

      context "with only unit" do
        let(:expression) { 'm/s' }

        its(:unit) { should == 'm/s' }
        its(:value) { should == 1.0 }
        its(:expression) { should == '1.0*m/s' } 
      end

      context "with no numerator" do
        let(:expression) { '10/s' }

        its(:unit) { should == '1.0/s' }
        its(:value) { should == 10.0 }
        its(:expression) { should == '10.0/s' } 
      end

      context 'with invalid format' do
        let(:expression) { 'km/kg/s' }
        it "should raise exception" do
          lambda { subject }.should raise_exception Unite::InvalidFormat
        end
      end

      context "with spaces" do
        let(:expression) { '10 * km / 5 *h ' }

        its(:unit) { should == 'km/h' }
        its(:value) { should == 2.0 }
        its(:expression) { should == '2.0*km/h' } 
      end

    end

    describe 'default' do
      subject { described_class.new } 
      its(:unit) { should == '' }
      its(:value) { should == 0.0 }
      its(:denominator) { should == [] } 
      its(:numerator) { should == [] }
    end

    describe "exponents" do
      let(:expression) { 'kg^2*m/s^3' }

      its(:expanded_numerator) { should =~ ['kg','kg', 'm'] }
      its(:expanded_denominator) { should =~ ['s', 's', 's' ] }
    end

    describe 'reduction of units' do

      context 'when of the same type' do
        let(:expression) { 'kg*s^2/s*kg^3' }

        its(:unit) { should == 's/kg^2' }
        its(:expression) { should == '1.0*s/kg^2' } 
      end

      context "with empty numerator" do
        let(:expression) { 'kg/kg^3' }

        its(:unit) { should == '1.0/kg^2' }
        its(:expression) { should == '1.0/kg^2' } 
      end

    end

    describe "inverse" do
      subject { described_class.new(:expression => expression).inverse }

      context "with unit ane value" do
        let(:expression) { "2*km/s" }

        its(:unit) { should == 's/km' }
        its(:value) { should == 0.5 }
        its(:expression) { should == '0.5*s/km' }
      end

      context "with blank expression" do
        let(:expression) { "" }

        its(:unit) { should == '' }
        its(:value) { should == 0.0 }
        its(:expression) { should == '0.0' }
      end


    end
  end

end
