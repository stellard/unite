# -*- encoding : utf-8 -*-
require 'spec_helper'

module Unite
  describe Quantity do

    subject { Quantity.new :expression => expression }

    include_examples "unit arithmetic"
    include_examples "comparable unit"
    include_examples "dimension integer"
    include_examples "convertable value"
    include_examples "dimension vectors"
    include_examples "unit fractions"


    describe ".init" do
      let(:quantity) { Quantity.new :expression => expression }

      context "with unit" do

        let(:expression) { "#{value}*#{unit}" }
        let(:value) { 200.0 } 
        let(:unit) { "km" }

        it "should initalize via expression" do
          Quantity.init(value,unit).should == quantity
        end
      end
      context "without unit" do
        let(:expression) { "#{value}" }
        let(:value) { 200.0 } 

        it "should initalize via expression" do
          Quantity.init(value).should == quantity
        end
      end
    end
  end
end

