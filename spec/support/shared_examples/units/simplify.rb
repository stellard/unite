# -*- encoding : utf-8 -*-
shared_examples "simplify units" do

  describe "converted unit" do
    subject {described_class.new(:expression => expression).simplify }


    context "with cancelling units" do
      let(:expression) { '5.7*km^2/m*h' }

      its(:unit) { should == 'km/h' }
      its(:value) { should be_within(1e-10).of(5700) }
      its(:expression) { should == '5700.0*km/h' }
    end

    context "with a equivalent derived unit" do
      let(:expression) { '1*kg*m^2/s^2' }

      its(:unit) { should == 'J' }
      its(:value) { should be_within(1e-10).of(1) }
      its(:expression) { should == '1.0*J' }
    end

  end
end

