require 'spec_helper'

describe ArticleUserInvitation do
	before do
		@article_user_invitation = ArticleUserInvitation.new(:sender_id => 1, :recipient_email => "goel.nishant.2014@gmail.com", :invitation_token => Digest::SHA1.hexdigest([Time.now, rand].join), :sent_at => Date.today, :article_id => 1)
	end

	subject { @article_user_invitation }

	it { should respond_to(:sender_id) }
	it { should respond_to(:recipient_email) }
	it { should respond_to(:invitation_token) }
	it { should respond_to(:sent_at) }
	it { should respond_to(:article_id) }

	describe "when sender_id is not present" do
        before { @article_user_invitation.sender_id  = nil }
        it { should_not be_valid }
    end
    describe "when sender_id is present" do
        before { @article_user_invitation.sender_id  = 1 }
        it { should be_valid }
    end
    
    describe "when invitation_token is not present" do
        before { @article_user_invitation.invitation_token  = nil }
        it { should be_valid }
    end
    describe "when invitation_token is present" do
        before { @article_user_invitation.invitation_token  = Digest::SHA1.hexdigest([Time.now, rand].join) }
        it { should be_valid }
    end

    describe "when sent_at is not present" do
        before { @article_user_invitation.sent_at  = nil }
        it { should be_valid }
    end
    describe "when sent_at is present" do
        before { @article_user_invitation.sent_at  = Date.today }
        it { should be_valid }
    end

    describe "when article_id is not present" do
        before { @article_user_invitation.article_id  = nil }
        it { should_not be_valid }
    end
    describe "when article_id is present" do
        before { @article_user_invitation.article_id  = 1 }
        it { should be_valid }
    end

    describe "when recipient_email is not present" do
        before { @article_user_invitation.recipient_email  = nil }
        it { should_not be_valid }
    end
    describe "when recipient_email is present" do
        before { @article_user_invitation.recipient_email  = "goel.nishant.2014@gmail.com" }
        it { should be_valid }
    end
    
    describe "when recipient_email format is invalid" do
        it "should be invalid" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
               	@article_user_invitation.recipient_email = invalid_address
               	@article_user_invitation.should_not be_valid
            end      
        end
    end

    describe "when recipient_email format is valid" do
        it "should be valid" do
            addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |valid_address|
                @article_user_invitation.recipient_email = valid_address
                @article_user_invitation.should be_valid
            end      
        end
    end
end




