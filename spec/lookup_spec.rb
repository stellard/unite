# -*- encoding : utf-8 -*-
require 'spec_helper'

module Unite
  describe Lookup do
    subject { Lookup }


    describe "adding and finding" do

      def unit_stub stubs_hash
        stub({:valid? => true, :errors => {} , :dimension_int => 30}.merge(stubs_hash))
      end

      def property_stub stubs_hash
        stub({:name => :quasar, :expression => 'qu', :valid? => true, :errors => {} , :dimension_int => 30}.merge(stubs_hash))
      end


      after do
        subject.reload!
      end

      describe "units" do
        let(:name) { 'scott' }
        let(:unit_object) { unit_stub(:valid? => valid, :name => name) }
        context "with invalid object" do
          let(:valid) { false }

          it "should raise an error" do
            lambda { subject.add(unit_object) }.should raise_exception(Lookup::Invalid)
          end

        end

        context "with valid object" do
          let(:valid) { true }
          before do
            subject.add(unit_object)
          end

          it 'should be able to find the unit by name' do
            subject.find!(name).should == unit_object
          end


          it "should raise not found if unit is undefined" do
            lambda { subject.find!(name+"undefined") }.should raise_exception(Lookup::Undefined)
          end

          context "with non uniq name" do
            let(:duplicate_name) { name }
            let(:duplicate_unit_object) { unit_stub(:name => duplicate_name) }

            it "should raise an error" do
              lambda { subject.add(duplicate_unit_object) }.should raise_exception(Lookup::Duplicate)
            end
          end

          describe "compatible units" do
            let(:compatible_unit_object) { unit_stub(:name => "unit_name1", :dimension_int => unit_object.dimension_int) }
            let(:incompatible_unit_object) { unit_stub(:name => "unit_name2", :dimension_int => (unit_object.dimension_int + 10)) }

            before do
              subject.add(compatible_unit_object)
              subject.add(incompatible_unit_object)
            end

            describe "by integer" do
              it "should find compatible units" do
                subject.compatible_units(unit_object.dimension_int).should =~ [compatible_unit_object, unit_object]
              end
            end

            describe "by property" do
              let(:property_object) { property_stub(:dimension_int => unit_object.dimension_int) }
              before do
                subject.add_property(property_object)
              end

              it "should find compatible units" do
                subject.compatible_units(property_object.name).should =~ [compatible_unit_object, unit_object]
              end
            end

          end


        end

        describe "property" do
          let(:propert_object) { property_stub(:name => :quasar, :expression => 'qu', :valid? => valid)}

          context 'with invalid object' do
            let(:valid) { false } 
            it "should raise an error" do
              lambda { subject.add_property(propert_object) }.should raise_exception(Lookup::Invalid)
            end
          end

          context 'with valid object' do
            let(:valid) { true }
            before do
              subject.add_property(propert_object)
            end

            it "should give a list of properties" do 
              subject.property_names.should include(propert_object.name)
            end

            it "should return nil if not found" do
              subject.find_property("undefined#{propert_object.name}").should == nil
            end

            it "should raise exception if already defined" do
              lambda {subject.add_property(propert_object)}.should raise_exception Lookup::Duplicate
            end

            it 'should be able to find by dimension id' do
              subject.find_property(propert_object.dimension_int).should == propert_object
            end

            it 'should be able to find by name' do
              subject.find_property(propert_object.name).should == propert_object
            end


          end
        end

      end

    end
  end
end
