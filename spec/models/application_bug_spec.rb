require 'spec_helper'

describe ApplicationBug do

	before do
        @application_bug = ApplicationBug.new(:bug_raised_by=> 1, :bug_details => "Test Details", :bug_raised_from_ip => "127.0.0.1", :bug_raised_from_platform => "Linux Kubuntu") 
  	end

  	subject { @application_bug }

  	it { should respond_to(:bug_raised_by) }
  	it { should respond_to(:bug_details) }
  	it { should respond_to(:bug_raised_from_ip) }
  	it { should respond_to(:bug_raised_from_platform) }

  	describe "when bug_raised_by is not present" do
        before { @application_bug.bug_raised_by = nil }
        it { should be_valid }
    end

    describe "when bug_raised_by is present" do
        before { @application_bug.bug_raised_by = 1 }
        it { should be_valid }
    end

    describe "when bug_details is not present" do
        before { @application_bug.bug_details = nil }
        it { should_not be_valid }
    end

    describe "when bug_details is present" do
        before { @application_bug.bug_details = "Test Details" }
        it { should be_valid }
    end

    describe "when bug_raised_from_ip is not present" do
        before { @application_bug.bug_raised_from_ip = nil }
        it { should_not be_valid }
    end

    describe "when bug_raised_from_ip is present" do
        before { @application_bug.bug_raised_from_ip = "127.0.0.1" }
        it { should be_valid }
    end

     describe "when bug_raised_from_platform is not present" do
        before { @application_bug.bug_raised_from_platform = nil }
        it { should_not be_valid }
    end

    describe "when bug_raised_from_platform is present" do
        before { @application_bug.bug_raised_from_platform = "Linux Kubuntu Mozzila Firefox 26" }
        it { should be_valid }
    end
end