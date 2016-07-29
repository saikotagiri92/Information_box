require 'spec_helper'

describe UsersHasOrganisations do
	before do
		@users_has_organisations = UsersHasOrganisations.new(:user_id => 1, :organisation_id => 1, :role_id => 1)
	end

	subject { @users_has_organisations }

	it { should respond_to(:user_id) }
	it { should respond_to(:organisation_id) }
	it { should respond_to(:role_id) }

	describe "when user_id is not present" do
        before { @users_has_organisations.user_id  = nil }
        it { should_not be_valid }
    end
    describe "when user_id is present" do
        before { @users_has_organisations.user_id  = 1 }
        it { should be_valid }
    end

    describe "when organisation_id is not present" do
        before { @users_has_organisations.organisation_id  = nil }
        it { should_not be_valid }
    end
    describe "when organisation_id is present" do
        before { @users_has_organisations.organisation_id  = 1 }
        it { should be_valid }
    end
    
    describe "when role_id is not present" do
        before { @users_has_organisations.role_id  = nil }
        it { should_not be_valid }
    end
    describe "when role_id is present" do
        before { @users_has_organisations.role_id  = 1 }
        it { should be_valid }
    end
end