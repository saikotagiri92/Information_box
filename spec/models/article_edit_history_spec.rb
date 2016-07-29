require 'spec_helper'

describe ArticleEditHistory do
	
    before do
    	@article_edit_history = ArticleEditHistory.new(:article_edited_by => 1, :article_id => 1, :article_edited_at => Time.now)
    end

    subject { @article_edit_history }

	it { should respond_to(:article_id)}
	it { should respond_to(:article_edited_by)}
	it { should respond_to(:article_edited_at)}

	describe "when article_id is present" do
		before { @article_edit_history.article_id = 1 }
		it { should be_valid }
	end
	describe "when article_id is not present" do
		before { @article_edit_history.article_id = nil }
		it { should_not be_valid }
	end

	describe "when article_edited_by is present" do
		before { @article_edit_history.article_edited_by = 1 }
		it { should be_valid }
	end
	describe "when article_edited_by is not present" do
		before { @article_edit_history.article_edited_by = nil }
		it { should_not be_valid }
	end

	describe "when article_edited_at is present" do
		before { @article_edit_history.article_edited_at = Time.now }
		it { should be_valid }
	end
	describe "when article_edited_at is not present" do
		before { @article_edit_history.article_edited_at = nil }
		it { should_not be_valid }
	end    
end
	