require 'spec_helper'
describe UserTeam do

    before do
        @user_team = UserTeam.new(:team_name=> "example team", :team_url_name => "example team".gsub(/[^0-9A-Za-z]/, '+'), :team_leader_id => 1, :team_size => 2, :created_by => 1, :organisation_id => 1, :team_last_updated_by => 1) 
  	end

  	subject { @user_team }

  	it { should respond_to(:team_name) }
  	it { should respond_to(:team_size) }
  	it { should respond_to(:team_leader_id) }
  	it { should respond_to(:team_last_updated_by) }
  	it { should respond_to(:created_by) }
  	it { should respond_to(:organisation_id) }
    it { should respond_to(:team_url_name)}

    describe "team_name is present" do
        before { @user_team.team_name = 'Mantraventures' }
        it { should be_valid }
    end
    describe "team_name is not present" do
        before { @user_team.team_name = nil }
        it { should_not be_valid }
    end

    describe "team_url_name is present" do
        before { @user_team.team_url_name = 'example team'.gsub(/[^0-9A-Za-z]/, '+') }
        it { should be_valid }
    end
    describe "team_url_name is not present" do
        before { @user_team.team_url_name = nil }
        it { should_not be_valid }
    end

    describe "team_size is present" do
        before { @user_team.team_size = 2 }
        it { should be_valid }
    end
    describe "team_size is not present" do
        before { @user_team.team_size = nil }
        it { should_not be_valid }
    end

    describe "team_leader_id is present" do
        before { @user_team.team_leader_id = 1 }
        it { should be_valid }
    end
    describe "team_leader_id is not present" do
        before { @user_team.team_leader_id = nil }
        it { should_not be_valid }
    end

    describe "created_by is present" do
        before { @user_team.created_by = 1 }
        it { should be_valid }
    end
    describe "created_by is not present" do
        before { @user_team.created_by = nil }
        it { should_not be_valid }
    end

    describe "organisation_id is present" do
        before { @user_team.organisation_id = 1 }
        it { should be_valid }
    end
    describe "organisation_id is not present" do
        before { @user_team.organisation_id = nil }
        it { should_not be_valid }
    end

    describe "team_last_updated_by is present" do
        before { @user_team.team_last_updated_by = 1 }
        it { should be_valid }
    end
    describe "team_last_updated_by is not present" do
        before { @user_team.team_last_updated_by = nil }
        it { should be_valid }
    end
end