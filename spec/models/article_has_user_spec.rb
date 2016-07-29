require 'spec_helper'

describe ArticleHasUser do
    
    before do
        @article_has_user = ArticleHasUser.new(:user_id => 1, :article_id => 1, :article_restriction_id => 1, :restriction_assigned_by => 1) 
  	end

  	subject { @article_has_user }

  	it { should respond_to(:user_id) }
  	it { should respond_to(:article_id) }
    it { should respond_to(:article_restriction_id)}
    it { should respond_to(:restriction_assigned_by)}

  	describe "when user_id is present" do
        before { @article_has_user.user_id = 1 }
        it { should be_valid }
    end
    describe "when user_id is not present" do
        before { @article_has_user.user_id = nil }
        it { should_not be_valid }
    end

    describe "when article_id is present" do
        before { @article_has_user.article_id = 2 }
        it { should be_valid }
    end
    describe "when article_id is not present" do
        before { @article_has_user.article_id = nil }
        it { should_not be_valid }
    end

    describe "when article_restriction_id is present" do
        before { @article_has_user.article_restriction_id = 2 }
        it { should be_valid }
    end
    describe "when article_restriction_id is not present" do
        before { @article_has_user.article_restriction_id = nil }
        it { should be_valid }
    end

    describe "when restriction_assigned_by is present" do
        before { @article_has_user.restriction_assigned_by = 2 }
        it { should be_valid }
    end
    describe "when restriction_assigned_by is not present" do
        before { @article_has_user.restriction_assigned_by = nil }
        it { should_not be_valid }
    end
end