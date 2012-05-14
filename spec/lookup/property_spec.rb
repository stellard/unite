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
end

