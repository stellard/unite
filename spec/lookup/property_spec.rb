# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'unite/lookup/property.rb'

module Unite
  describe Property do
    it { should validate_presence_of(:name)}


    include_examples "comparable unit"
    include_examples "dimension integer"
    include_examples "convertable value"
    include_examples "dimension vectors"
    include_examples "unit fractions"

  end

  describe "to_s and to_sym" do
    subject { Property.new :name => name }
    let(:name) { "mass" }
    its(:to_s) { should == name }
    its(:to_sym) { should == name.to_sym }
  end
end

