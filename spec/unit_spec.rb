# -*- encoding : utf-8 -*-
require 'spec_helper'

module Unite
  describe Unit do

    subject { Unit.new :expression => expression }

    #include_examples "comparable unit"
    #include_examples "dimension integer"
    #include_examples "dimension vectors"
    #include_examples "unit fractions"


    describe ".init" do
      subject { Unit.init expression }

      context "with just value" do
        let(:expression) { "200.0" }
        let(:value) { 200.0 } 

        its(:unit) { should == '' }
        its(:value) { should == 1 }
      end

      context "with only unit" do
        let(:expression) { "#{unit}" }
        let(:unit) { 'L' }

        its(:unit) { should == unit }
        its(:value) { should == 1 }
      end

      context "with unit and value" do
        let(:expression) { "2.0*#{unit}" }
        let(:unit) { 'L/m^3' }
        its(:unit) { should == unit }
        its(:value) { should == 1 }
      end

    end
  end
end

