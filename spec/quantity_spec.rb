# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Quantity do

  subject { Quantity.new :expression => expression } 

  include_examples "unit arithmetic"
  include_examples "comparable unit"
  include_examples "dimension integer"
  include_examples "convertable value"
  include_examples "dimension vectors"
  include_examples "unit fractions"
end
