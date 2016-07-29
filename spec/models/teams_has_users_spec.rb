require 'spec_helper'
describe TeamsHasUsers do

    before do
        @user_team = TeamsHasUsers.new(:user_id => 1, :user_team_id => 1) 
  	end

  	subject { @user_team }

  	it { should respond_to(:user_id) }
  	it { should respond_to(:user_team_id) }

  	describe "user_id is present" do
        before { @user_team.user_id = 1 }
        it { should be_valid }
    end
    describe "user_id is not present" do
        before { @user_team.user_id = nil }
        it { should_not be_valid }
    end

    describe "user_team_id is present" do
        before { @user_team.user_team_id = 2 }
        it { should be_valid }
    end
    describe "user_team_id is not present" do
        before { @user_team.user_team_id = nil }
        it { should_not be_valid }
    end
end