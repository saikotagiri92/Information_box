require 'spec_helper'

describe User do
	
    describe "User name initials" do
        describe "when user name is not received" do
            it "should return nil" do
                user_name = nil
                user_name, user_name_initials = User.user_name_initials(user_name)
                user_name_initials.should == nil
            end
        end
        describe "when user name is received" do
            describe "when user name has only one word in the name" do
                it "should retrun name such that first letter should be first two letters of the original name" do
                    user_name ="Nishant" 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "Ni"
                end
            end

            describe "when user name has only one word in the name & first letter of name is small caps" do
                it "should retrun name such that first letters should be first two letters of the original name & should capitalize the first letter" do
                    user_name ="nishant" 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "Ni"
                end
            end

            describe "when user name has two words in the name" do
                it "should retrun initials with first letter of name words" do
                    user_name ="Nishant Goel" 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "NG"
                end
            end     

            describe "when user name has more than two words in the name" do
                it "should retrun initials with first letter of first two words" do
                    user_name ="Nishant Kavita Goel " 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "NK"
                end
            end

            describe "when user name has more than two words in the name & first word has first letter is small" do
                it "should retrun initials with first letter of first two words in capitals" do
                    user_name ="nishant Kavita Goel " 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "NK"
                end
            end

            describe "when user name has more than two words in the name & sexcond has first letter is small" do
                it "should retrun initials with first letter of first two words in capitals" do
                    user_name ="Nishant kavita Goel " 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "NK"
                end
            end

            describe "when user name has more than two words in the name & first two words has first letter is small" do
                it "should retrun initials with first letter of first two words in capitals" do
                    user_name ="nishant kavita Goel " 
                    user_name, user_name_initials = User.user_name_initials(user_name)
                    user_name_initials.should == "NK"
                end
            end
        end
    end
    describe "user_role_in_organisation" do
        describe "when user is not an member of the organisation" do
            it "should return role_type as nil" do
                user = User.create(user_name: "Nishant", user_email: "nishant@#{SecureRandom.urlsafe_base64}.com", :password => "nishant18", :password_confirmation => "nishant18", remember_token: "ced590cd68a45a3a5de4f2af180bdf7ad5c80d97", password_reset_sent_on: nil, created_at: "2013-08-28 08:25:23", updated_at: "2013-08-31 05:50:08", password_reset_token: nil)    
                organisation_name = SecureRandom.urlsafe_base64
                organisation = Organisation.create(:organisation_name => organisation_name, :owner_id => user.id, :subdomain => organisation_name.gsub(/[^0-9A-Za-z]/, ''), :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
                user_role_type, organisation_id, user_id =  User.user_role_in_organisation(user.id, organisation.id)
                user_role_type.should == nil
            end
        end
        describe "when user is an member of the organisation" do
            it "should return role_type" do
                user = User.create(user_name: "Nishant", user_email: "nishant@#{SecureRandom.urlsafe_base64}.com", :password => "nishant18", :password_confirmation => "nishant18", remember_token: "ced590cd68a45a3a5de4f2af180bdf7ad5c80d97", password_reset_sent_on: nil, created_at: "2013-08-28 08:25:23", updated_at: "2013-08-31 05:50:08", password_reset_token: nil)    
                organisation_name = SecureRandom.urlsafe_base64
                organisation = Organisation.create(:organisation_name => organisation_name, :owner_id => user.id, :subdomain => organisation_name.gsub(/[^0-9A-Za-z]/, ''), :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
                UsersHasOrganisations.create(:user_id => user.id, :organisation_id => organisation.id, :role_id => 1)
                Role.user_role_type('admin_user')
                user_role_type, organisation_id, user_id =  User.user_role_in_organisation(user.id, organisation.id)
                user_role_type.should_not == nil
            end
        end
    end

    describe "user restriction in article" do
        describe "when article_id & user_id not received"  do
            it "shouldn't return user restriction in box" do
                user_id = nil
                article_id = nil
                user_restriction_in_article = User.user_restriction_in_article(user_id, article_id)
                user_restriction_in_article.should == nil
            end
        end

        describe "when article_id & user_id is received"  do
            it "should return user restriction in box" do
                user_id = User.create(user_name: "Nishant", user_email: "nishant@#{SecureRandom.urlsafe_base64}.com", :password => "nishant18", :password_confirmation => "nishant18", remember_token: "ced590cd68a45a3a5de4f2af180bdf7ad5c80d97", password_reset_sent_on: nil, created_at: "2013-08-28 08:25:23", updated_at: "2013-08-31 05:50:08", password_reset_token: nil).id 
                box_name = SecureRandom.urlsafe_base64
                box_id = Box.create(:box_name => box_name, :organisation_id => 1, :created_by => user_id, :box_url_name => box_name.gsub(/[^0-9A-Za-z]/, '+')).id
                article_title = SecureRandom.urlsafe_base64
                article_id =Article.create(:article_title => "Home", :box_id => box_id, :created_by => user_id, :article_url_title => article_title.gsub(/[^0-9A-Za-z]/, '+')).id
                user_restriction_in_article = User.user_restriction_in_article(user_id, article_id)
                user_restriction_in_article.should_not == nil 
            end
        
        end
    end

    describe "user restriction in box" do
        describe "when box_id & user_id not received"  do
            it "shouldn't return user restriction in box" do
                user_id = nil
                box_id = nil
                user_restriction_in_box = User.user_restriction_in_box(user_id, box_id)
                user_restriction_in_box.should == nil
            end
        end

        describe "when box_id & user_id is received"  do
            it "should return user restriction in box" do
                user_id = User.create(user_name: "Nishant", user_email: "nishant@#{SecureRandom.urlsafe_base64}.com", :password => "nishant18", :password_confirmation => "nishant18", remember_token: "ced590cd68a45a3a5de4f2af180bdf7ad5c80d97", password_reset_sent_on: nil, created_at: "2013-08-28 08:25:23", updated_at: "2013-08-31 05:50:08", password_reset_token: nil).id 
                box_name = SecureRandom.urlsafe_base64
                box_id = Box.create(:box_name => box_name, :organisation_id => 1, :created_by => user_id, :box_url_name => box_name.gsub(/[^0-9A-Za-z]/, '+')).id
                user_restriction_in_box = User.user_restriction_in_box(user_id, box_id)
                user_restriction_in_box.should_not == nil 
            end
        end
    end
    describe "send_password_reset" do
        it "should update the values of attributes password_reset_token & in password_reset_sent_on in users table" do
            user = User.create(user_name: "Nishant", user_email: "nishant@#{SecureRandom.urlsafe_base64}.com", :password => "nishant18", :password_confirmation => "nishant18", remember_token: "ced590cd68a45a3a5de4f2af180bdf7ad5c80d97", password_reset_sent_on: nil, created_at: "2013-08-28 08:25:23", updated_at: "2013-08-31 05:50:08", password_reset_token: nil)
            UserMailer.stub(:user_password_reset)
            UserMailer.user_password_reset.stub!(:deliver)
            user.send_password_reset
            User.find(user).password_reset_token.should_not == nil
            User.find(user).password_reset_sent_on.should_not == nil
        end
    end

    before do
        @user = User.new(:user_name=> "Example User", :user_email => "user@example.com", :password => "nishant18", :password_confirmation => "nishant18", :user_bio => "user_bio", :user_designation => "ROR Developer", :facebook_profile_link => "facebook_profile_link", :linkedin_profile_link => "linkedin_profile_link", :twitter_profile_link => "twitter_profile_link", :article_user_invitation_id => nil, :password_reset_from_ip_address => nil, :email_verification_token => nil, :email_verification_status => nil) 
  	end

  	subject { @user }

  	it { should respond_to(:user_name) }
  	it { should respond_to(:user_email) }
  	it { should respond_to(:password_digest) }
  	it { should respond_to(:password) }
  	it { should respond_to(:password_confirmation) }
  	it { should respond_to(:remember_token) }
  	it { should respond_to(:authenticate) }
  	it { should respond_to(:password_reset_sent_on) }
  	it { should respond_to(:password_reset_token) }
    it { should respond_to(:password_reset_from_ip_address) }
    it { should respond_to(:user_bio) }
    it { should respond_to(:user_designation) }
    it { should respond_to(:linkedin_profile_link) }
    it { should respond_to(:facebook_profile_link) }
    it { should respond_to(:twitter_profile_link) }
    it { should respond_to(:article_user_invitation_id)}
    it { should respond_to(:email_verification_token)}
    it { should respond_to(:email_verification_status)}
    it { should be_valid }

    describe "when user_name is not present" do
        before { @user.user_name = " " }
        it { should_not be_valid }
    end

    describe "remember token" do
    	before { @user.save }
        it(:remember_token) { should_not be_blank }
    end
    
    describe "password_reset_sent_on" do
    	before { @user.password_reset_sent_on = nil } 
    		 
        it { should be_valid }
    end 
    describe "when user_email is not present" do
      	before { @user.user_email = " " }
        it { should_not be_valid }
    end

    describe "when user_name is too long" do
        before { @user.user_name = "a" * 251 }
        it { should_not be_valid }
    end
        
    describe "when user_email format is invalid" do
        it "should be invalid" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
               	@user.user_email = invalid_address
               	@user.should_not be_valid
            end      
        end
    end

    describe "when user_email format is valid" do
        it "should be valid" do
            addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |valid_address|
                @user.user_email = valid_address
                @user.should be_valid
            end      
        end
    end
        
    describe "when user_email address is already taken" do
        before do
            user_with_same_email = @user.dup
            user_with_same_email.user_email = @user.user_email.upcase
            user_with_same_email.save
        end

        it { should_not be_valid }
    end
        
    describe "when password is not present" do
        before { @user.password = @user.password_confirmation = " " }
        it { should_not be_valid }
    end

    describe "when password is present" do
        before { @user.password = @user.password_confirmation = "foobar18" }
        it { should be_valid }
    end

    describe "when passwords doesn't match" do
        before { @user.password ="nishant18" 
                @user.password_confirmation = "foobar18" }
        it { should_not be_valid }
    end

    describe "when password field is nil" do
        before { @user.password ="" 
                @user.password_confirmation = "foobar18" }
        it { should_not be_valid }
    end

   	describe "with a password that's too short" do
        before { @user.password = @user.password_confirmation = "a" * 5 }
        it { should be_invalid }
    end

    describe "when password format is not correct" do
        before { @user.password = @user.password_confirmation = "foobar" }
        it { should_not be_valid }
    end

    describe "when password format is correct" do
        before { @user.password = @user.password_confirmation = "foobar18" }
        it { should be_valid }
    end


    describe "return value of authenticate method" do
        before { @user.save }
        let(:found_user) { User.find_by_user_email(@user.user_email) }
       	
       	describe "with valid password" do
            it { should == found_user.authenticate(@user.password) }
        end
        
        describe "with invalid password" do
            let(:user_for_invalid_password) { found_user.authenticate("invalid") }
            it { should_not == user_for_invalid_password }
            specify { user_for_invalid_password.should be_false }
        end
    end

    describe "when user_bio is present" do
        before { @user.user_bio = 'Mantraventures' }
        it { should be_valid }
    end
    describe "when user_bio is not present" do
        before { @user.user_bio = nil }
        it { should be_valid }
    end

    describe "when user_designation is present" do
        before { @user.user_designation = 'RoR Developer' }
        it { should be_valid }
    end
    describe "when user_designation is not present" do
        before { @user.user_designation = nil }
        it { should be_valid }
    end

    describe "when twitter_profile_link is present" do
        before { @user.twitter_profile_link = 'twitter_profile_link' }
        it { should be_valid }
    end
    describe "when twitter_profile_link is not present" do
        before { @user.twitter_profile_link = nil }
        it { should be_valid }
    end

    describe "when facebook_profile_link is present" do
        before { @user.facebook_profile_link = 'facebook_profile_link' }
        it { should be_valid }
    end
    describe "when facebook_profile_link is not present" do
        before { @user.facebook_profile_link = nil }
        it { should be_valid }
    end

    describe "when linkedin_profile_link is present" do
        before { @user.linkedin_profile_link = 'linkedin_profile_link' }
        it { should be_valid }
    end
    describe "when linkedin_profile_link is not present" do
        before { @user.linkedin_profile_link = nil }
        it { should be_valid }
    end

    describe "when article_user_invitation_id is present" do
        before { @user.article_user_invitation_id = 1 }
        it { should be_valid }
    end
    describe "when article_user_invitation_id is not present" do
        before { @user.article_user_invitation_id = nil }
        it { should be_valid }
    end

    describe "when password_reset_from_ip_address is not present" do
        before { @user.password_reset_from_ip_address = nil }
        it { should be_valid }
    end


    describe "when email_verification_token is present" do
        before { @user.email_verification_token = 'email_verification_token' }
        it { should be_valid }
    end
    describe "when email_verification_token is not present" do
        before { @user.email_verification_token = nil }
        it { should be_valid }
    end


    describe "when email_verification_status is present" do
        before { @user.email_verification_status = true }
        it { should be_valid }
    end
    describe "when email_verification_status is not present" do
        before { @user.email_verification_status = nil }
        it { should be_valid }
    end
end