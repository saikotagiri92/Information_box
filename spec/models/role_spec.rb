require 'spec_helper'

describe Role do
	describe "user_role_type" do
        it "should get an user role type info" do
            role_type = "admin_user"
            role_type_id, role_type =  Role.user_role_type(role_type)
            role_type.should == 'admin_user'
        end

        describe "role_type not defined in roles table" do
            it "should create an entry in roles table with given role_type & should return its id" do
                role_type = "admin_user"
                role_type_id, role_type =  Role.user_role_type(role_type)
                role_type.should == 'admin_user'
            end
        end                
        
        describe "role_type is defined in roles table" do
            it "should return its id" do
                role_type = "normal_user"
                role_type_id, role_type =  Role.user_role_type(role_type)
                role_type.should == 'normal_user'
            end
        end 
    end

    before do
		@role = Role.new(:role_name => "admin", :role_description => "An admin has permissions to do anything")
	end

	subject { @role }

	it {should respond_to(:role_name)}
	it {should respond_to(:role_description)}

	describe "when role_name is not present" do
        before { @role.role_name  = nil }
        it { should_not be_valid }
    end
    describe "when role_name is present" do
        before { @role.role_name  = "admin" }
        it { should be_valid }
    end
    describe "when role_name is too long" do
        before { @role.role_name = "a" * 101 }
        it { should_not be_valid }
    end
    describe "when role_name is too short" do
        before { @role.role_name = "a" * 99 }
        it { should be_valid }
    end

    describe "when role_description is not present" do
        before { @role.role_description  = nil }
        it { should_not be_valid }
    end
    describe "when role_description is present" do
        before { @role.role_description  = "An admin has permissions to do anything" }
        it { should be_valid }
    end
end