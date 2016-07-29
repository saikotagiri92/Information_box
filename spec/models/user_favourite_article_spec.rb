require 'spec_helper'

describe UserFavouriteArticle do
    
    before do
        @user_favourite_article = UserFavouriteArticle.new(:user_id => 1, :article_id => 1, :organisation_id => 1, :box_id => 1) 
  	end

  	subject { @user_favourite_article }

    it { should respond_to(:article_id)}
    it { should respond_to(:box_id)}
    it { should respond_to(:organisation_id)}
    it { should respond_to(:user_id)}
    

    describe "when user_id is not present" do
        before { @user_favourite_article.user_id = nil }
        it { should_not be_valid }
    end

    describe "when user_id is present" do
        before { @user_favourite_article.user_id = 1 }
        it { should be_valid }
    end
    
    describe "when box_id is not present" do
        before { @user_favourite_article.box_id = nil }
        it { should_not be_valid }
    end

    describe "when box_id is present" do
        before { @user_favourite_article.box_id = 1 }
        it { should be_valid }
    end

    describe "when article_id is not present" do
        before { @user_favourite_article.article_id = nil }
        it { should_not be_valid }
    end

    describe "when article_id is present" do
        before { @user_favourite_article.article_id = 1 }
        it { should be_valid }
    end

    describe "when organisation_id is not present" do
        before { @user_favourite_article.organisation_id = nil }
        it { should_not be_valid }
    end

    describe "when organisation_id is present" do
        before { @user_favourite_article.organisation_id = 1 }
        it { should be_valid }
    end
end