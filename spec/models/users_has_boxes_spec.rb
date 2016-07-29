require 'spec_helper'

describe UsersHasBoxes do
	
	before do 
		@users_has_boxes = UsersHasBoxes.new(:box_id => 1, :user_id => 1, :box_restriction_id => 1, :restriction_assigned_by => 1)
	end

	subject { @users_has_boxes }

	it { should respond_to(:box_id) }
	it { should respond_to(:user_id) }
	it { should respond_to(:box_restriction_id) }
	it { should respond_to(:restriction_assigned_by) }

	describe "when box_id is present" do
		before { @users_has_boxes.box_id = 1 }
		it { should be_valid }
	end
	describe "when box_id is not present" do
		before { @users_has_boxes.box_id = nil }
		it { should_not be_valid }
	end

	describe "when user_id is present" do
		before { @users_has_boxes.user_id = 1 }
		it { should be_valid }
	end
	describe "when user_id is not present" do
		before { @users_has_boxes.user_id = nil }
		it { should_not be_valid }
	end

	describe "when box_restriction_id is present" do
		before { @users_has_boxes.box_restriction_id = 1 }
		it { should be_valid }
	end
	describe "when box_restriction_id is not present" do
		before { @users_has_boxes.box_restriction_id = nil }
		it { should be_valid }
	end

	describe "when restriction_assigned_by is present" do
		before { @users_has_boxes.restriction_assigned_by = 1 }
		it { should be_valid }
	end
	describe "when restriction_assigned_by is not present" do
		before { @users_has_boxes.restriction_assigned_by = nil }
		it { should_not be_valid }
	end
end