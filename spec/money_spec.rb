# require 'spec_helper'

# module Unite
  # describe "Money Conversions" do
  #   describe "performing arithmetic" do
  #     subject { Quantity.init("100", "GBP") }

  #     context "when currency is the same" do
  #       let(:other) { Quantity.init("100", "GBP") }

  #       [:+,:-, :/, :*].each do |op|
  #         it "should not raise error when op is #{op}" do
  #           lambda { subject.send(op,other) }.should_not raise_exception
  #         end
  #       end

  #     end

  #     context "when currency is different" do
  #       let(:other) { Quantity.init("100", "CAD") }

  #       [:+,:-, :/, :*].each do |op|
  #         it "should not raise error when op is #{op}" do
  #           subject.send(op,other)
  #           # lambda { 
  #             # debugger
  #             # subject.send(op,other) }.should_not raise_exception
  #         end
  #       end

  #     end

  #   end
  # end
# end
