require 'spec_helper'

describe AdminUser do
    
    before(:each) do
        @admin_user = AdminUser.new(:admin_user_name=> "Example User", :admin_user_email => "user@example.com", :password => "nishant18", :password_confirmation => "nishant18") 
  	 
    end

  	subject { @admin_user }

  	it { should respond_to(:admin_user_name) }
  	it { should respond_to(:admin_user_email) }
  	it { should respond_to(:password_digest) }
  	it { should respond_to(:password) }
  	it { should respond_to(:password_confirmation) }
  	it { should respond_to(:admin_user_remember_token) }
  	it { should respond_to(:authenticate) }
  	it { should be_valid }
    describe "when admin_user_name is not present" do
        before { @admin_user.admin_user_name = " " }
        it { should_not be_valid }
    end

    describe "remember token" do
        before { @admin_user.save }
        it(:admin_user_remember_token) { should_not be_blank }
    end
    
    
    describe "when admin_user_email is not present" do
      	before { @admin_user.admin_user_email = " " }
        it { should_not be_valid }
    end

    describe "when admin_user_name is too long" do
        before { @admin_user.admin_user_name = "a" * 251 }
        it { should_not be_valid }
    end
        
    describe "when admin_user_email format is invalid" do
        it "should be invalid" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
               	@admin_user.admin_user_email = invalid_address
               	@admin_user.should_not be_valid
            end      
        end
    end

    describe "when admin_user_email format is valid" do
        it "should be valid" do
            addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |valid_address|
                @admin_user.admin_user_email = valid_address
                @admin_user.should be_valid
            end      
        end
    end
        
    describe "when admin_user_email address is already taken" do
        before do
            user_with_same_email = @admin_user.dup
            user_with_same_email.admin_user_email = @admin_user.admin_user_email.upcase
            user_with_same_email.save
        end
        
        it { should_not be_valid }
    end
        
    describe "when password is not present" do
        before { @admin_user.password = @admin_user.password_confirmation = " " }
        it { should_not be_valid }
    end

    describe "when password is present" do
        before { @admin_user.password = @admin_user.password_confirmation = "foobar18" }
        it { should be_valid }
    end

    describe "when passwords doesn't match" do
        before { @admin_user.password ="nishant18" 
                @admin_user.password_confirmation = "foobar18" }
        it { should_not be_valid }
    end

    describe "when password field is nil" do
        before { @admin_user.password ="" 
                @admin_user.password_confirmation = "foobar18" }
        it { should_not be_valid }
    end

   	describe "with a password that's too short" do
        before { @admin_user.password = @admin_user.password_confirmation = "a" * 5 }
        it { should be_invalid }
    end

    describe "when password format is not correct" do
        before { @admin_user.password = @admin_user.password_confirmation = "foobar" }
        it { should_not be_valid }
    end

    describe "when password format is correct" do
        before { @admin_user.password = @admin_user.password_confirmation = "foobar18" }
        it { should be_valid }
    end


    describe "return value of authenticate method" do
        before { @admin_user.save }
        let(:found_user) { AdminUser.find_by_admin_user_email(@admin_user.admin_user_email) }
       	
       	describe "with valid password" do
            it { should == found_user.authenticate(@admin_user.password) }
        end
        
        describe "with invalid password" do
            let(:user_for_invalid_password) { found_user.authenticate("invalid") }
            it { should_not == user_for_invalid_password }
            specify { user_for_invalid_password.should be_false }
        end
    end
end