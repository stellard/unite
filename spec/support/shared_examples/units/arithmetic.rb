# -*- encoding : utf-8 -*-
shared_examples "unit arithmetic" do

  shared_examples "addition operation" do

    context "addition result" do
      subject { object1 + object2 } 
      let(:addition_value) { addition_result.first } 
      let(:addition_unit) { addition_result.last } 

      its(:value) { should == addition_value }
      its(:unit) { should == addition_unit }
    end

  end
  shared_examples "subtraction operation" do

    context "subtraction result" do
      subject { object1 - object2 } 
      let(:subtraction_value) { subtraction_result.first } 
      let(:subtraction_unit) { subtraction_result.last }

      its(:value) { should == subtraction_value }
      its(:unit) { should == subtraction_unit }
    end

  end
  shared_examples "multiplication operation" do

    context "multiplication result" do
      subject { object1 * object2 } 
      let(:multiplication_value) { multiplication_result.first } 
      let(:multiplication_unit) { multiplication_result.last } 

      its(:value) { should == multiplication_value }
      its(:unit) { should == multiplication_unit }
    end

  end
  shared_examples "division operation" do

    context "division result" do
      subject { object1 / object2 } 
      let(:division_value) { division_result.first } 
      let(:division_unit) { division_result.last } 

      its(:value) { should == division_value }
      its(:unit) { should == division_unit }
    end

  end

  describe "arithmetic" do
    describe 'with no units' do
      let(:expression1) { 100.0 }
      let(:expression2) { 10.0 }

      let(:addition_result) { [110.0, ''] }
      let(:subtraction_result) { [90.0, ''] }
      let(:division_result) { [10.0, ''] }
      let(:multiplication_result) { [1000.0, ''] }

      context "with an numeric as the first object" do
        let(:object1) { expression1.to_f }
        let(:object2) { described_class.new :expression => expression2.to_s }

        include_examples "addition operation"
        include_examples "subtraction operation"
        include_examples "multiplication operation"
        include_examples "division operation"
      end


      context "with an numeric as the second object" do
        let(:object1) { described_class.new :expression => expression1.to_s }
        let(:object2) { expression2.to_f }

        include_examples "addition operation"
        include_examples "subtraction operation"
        include_examples "multiplication operation"
        include_examples "division operation"
      end

    end

    context "with units" do
      let(:object1) { described_class.new :expression => expression1 }
      let(:object2) { described_class.new :expression => expression2 }

      context "that are compatible" do
        let(:expression1) { "10*km" }
        let(:expression2) { "1000*m" }

        let(:addition_result) { [11.0, 'km'] }
        let(:subtraction_result) { [9.0, 'km'] }
        let(:division_result) { [10.0, ''] }
        let(:multiplication_result) { [10.0, 'km^2'] }

        include_examples "addition operation"
        include_examples "subtraction operation"
        include_examples "multiplication operation"
        include_examples "division operation"
      end

      context "that are incompatible " do
        let(:expression1) { "10*kg" }
        let(:expression2) { "10*m" }

        let(:division_result) { [1.0, 'kg/m'] }
        let(:multiplication_result) { [100.0, 'kg*m'] }

        include_examples "multiplication operation"
        include_examples "division operation"

        it "should raise error for subtraction" do
          lambda { object1 - object2 }.should raise_exception Units::IncompatibleError
        end
        it "should raise error for addition" do
          lambda { object1 + object2 }.should raise_exception Units::IncompatibleError
        end

      end

    end
  end
end

