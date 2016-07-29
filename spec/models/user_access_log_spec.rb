require 'spec_helper'

describe UserAccessLog do
	
    before do
		@user_access_log = UserAccessLog.new(:user_id => 1, :login_organisation_id => nil, :login_ip_address => "127.0.0.1", :login_device_name => "Windows 7 Chrome", :login_time => Time.now, :logout_time => nil, :session_time => nil)
	end

	subject { @user_access_log }

	it { should respond_to(:user_id) }
	it { should respond_to(:login_organisation_id) }
	it { should respond_to(:login_ip_address) }
	it { should respond_to(:login_device_name) }
	it { should respond_to(:login_time) }
	it { should respond_to(:logout_time) }
	it { should respond_to(:session_time) }

	describe "when user_id is not present" do
        before {@user_access_log.user_id = nil }
        it { should_not be_valid }
    end

    describe "when user_id is present" do
        before {@user_access_log.user_id = 1 }
        it { should be_valid }
    end

    describe "when login_organisation_id is not present" do
        before {@user_access_log.login_organisation_id = nil }
        it { should be_valid }
    end

    describe "when login_ip_address is not present" do
        before {@user_access_log.login_ip_address = nil }
        it { should_not be_valid }
    end

    describe "when login_ip_address is present" do
        before {@user_access_log.login_ip_address = "127.0.0.1" }
        it { should be_valid }
    end

    describe "when login_ip_address" do
        before {@user_access_log.login_ip_address = "127.0.0.1" }
        it { should be_valid }
    end

    describe "when login_device_name is not present" do
        before {@user_access_log.login_device_name = nil }
        it { should_not be_valid }
    end

    describe "when login_device_name is present" do
        before {@user_access_log.login_device_name = "Windows 7 Chrome" }
        it { should be_valid }
    end

    describe "when login_time is not present" do
        before {@user_access_log.login_time = nil }
        it { should_not be_valid }
    end

    describe "when login_time is present" do
        before {@user_access_log.login_time = Time.now }
        it { should be_valid }
    end

    describe "when logout_time is not present" do
        before {@user_access_log.logout_time = nil }
        it { should be_valid }
    end

    

    describe "when session_time is not present" do
        before {@user_access_log.session_time = nil }
        it { should be_valid }
    end
end
   

    
