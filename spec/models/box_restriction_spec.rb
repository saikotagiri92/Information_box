require 'spec_helper'

describe BoxRestriction do
	describe "User restriction for a box" do
		describe "when user restriction type for an article is received" do
			describe "when an entry in the box_restrictions with the given restriction: view restrictions is not present" do
				it "should create an entry in the table & return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end

			describe "when an entry in the box_restrictions with the given restriction: edit restrictions is not present" do
				it "should create an entry in the table & return the restriction entry id with the restriction type" do
					restriction_type = "edit restrictions"
					box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
					restriction_type.should == "edit restrictions"
				end
			end

			describe "when an entry in the box_restrictions with the given restriction: no restrictions is not present" do
				it "should create an entry in the table & return the restriction entry id with the restriction type" do
					restriction_type = "no restrictions"
					box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
					restriction_type.should == "no restrictions"
				end
			end

			describe "when an entry in the box_restrictions with the given restriction: view restrictions is present" do
				it "should return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end

			describe "when an entry in the box_restrictions with the given restriction: edit restrictions is present" do
				it "should return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end

			describe "when an entry in the box_restrictions with the given restriction: no restrictions is present" do
				it "should return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end
		end
		describe "when user restriction type for an article is not received" do
			it "should return the restriction entry id with the restriction type" do
				restriction_type = nil
				box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id(restriction_type)
				box_restriction_type_id.should == nil
				restriction_type.should == nil
			end
		end
	end

	before do 
		@box_restriction = BoxRestriction.new(:restriction_type => "view restrictions", :restriction_description => "An user can view any article in a box")
	end

	subject { @box_restriction }

	it {should respond_to(:restriction_type)}
	it {should respond_to(:restriction_description)}

	describe "when restriction_type is present" do
		before { @box_restriction.restriction_type = 'view restrictions' }
		it { should be_valid }
	end
	describe "when restriction_type is not present" do
		before { @box_restriction.restriction_type = nil }
		it { should_not be_valid }
	end

	describe "when restriction_description is present" do
		before { @box_restriction.restriction_description = 'An user can view the box' }
		it { should be_valid }
	end
	describe "when restriction_description is not present" do
		before { @box_restriction.restriction_description = nil }
		it { should be_valid }
	end
end