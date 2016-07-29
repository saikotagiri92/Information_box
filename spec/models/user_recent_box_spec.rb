require 'spec_helper'

describe UserRecentBox do
    before do
        @user_recent_box = UserRecentBox.new(:user_id => 1, :organisation_id => 1, :box_id => 1) 
  	end

  	subject { @user_recent_box }

    it { should respond_to(:box_id)}
    it { should respond_to(:organisation_id)}
    it { should respond_to(:user_id)}
    

    describe "when user_id is not present" do
        before { @user_recent_box.user_id = nil }
        it { should_not be_valid }
    end

    describe "when user_id is present" do
        before { @user_recent_box.user_id = 1 }
        it { should be_valid }
    end
    
    describe "when box_id is not present" do
        before { @user_recent_box.box_id = nil }
        it { should_not be_valid }
    end

    describe "when box_id is present" do
        before { @user_recent_box.box_id = 1 }
        it { should be_valid }
    end


    describe "when organisation_id is not present" do
        before { @user_recent_box.organisation_id = nil }
        it { should_not be_valid }
    end

    describe "when organisation_id is present" do
        before { @user_recent_box.organisation_id = 1 }
        it { should be_valid }
    end
end