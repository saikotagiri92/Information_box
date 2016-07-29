require 'spec_helper'

describe Comment do
	before do 
		@comment = Comment.new(
								:article_id => 1, 
								:posted_by => 1, 
								:comment_content => "comment_content", 
								:deleted_on => nil, 
								:deleted_by => nil, 
								:last_updated_by => nil , 
								:parent_id => nil
							) 
	end

	subject { @comment }

	it { should respond_to(:article_id) }
	it { should respond_to(:posted_by) }
	it { should respond_to(:comment_content) }
	it { should respond_to(:deleted_on) }
	it { should respond_to(:deleted_by) }
	it { should respond_to(:last_updated_by) }
	it { should respond_to(:parent_id) }

	describe "article_id is present" do
		before { @comment.article_id = 1 }
		it { should be_valid }
	end
	describe "article_id is not present" do
		before { @comment.article_id = nil }
		it { should_not be_valid }
	end

	describe "posted_by is present" do
		before { @comment.posted_by = 1 }
		it { should be_valid }
	end
	describe "posted_by is not present" do
		before { @comment.posted_by = nil }
		it { should_not be_valid }
	end

	describe "comment_content is present" do
		before { @comment.comment_content = "comment_content" }
		it { should be_valid }
	end
	describe "comment_content is not present" do
		before { @comment.comment_content = nil }
		it { should_not be_valid }
	end

	describe "deleted_on is present" do
		before { @comment.deleted_on = Date.today }
		it { should be_valid }
	end
	describe "deleted_on is not present" do
		before { @comment.deleted_on = nil }
		it { should be_valid }
	end

	describe "deleted_by is present" do
		before { @comment.deleted_by = 1 }
		it { should be_valid }
	end
	describe "deleted_by is not present" do
		before { @comment.deleted_by = nil }
		it { should be_valid }
	end

	describe "last_updated_by is present" do
		before { @comment.last_updated_by = 1 }
		it { should be_valid }
	end
	describe "last_updated_by is not present" do
		before { @comment.last_updated_by = nil }
		it { should be_valid }
	end

	describe "parent_id is present" do
		before { @comment.parent_id = 1 }
		it { should be_valid }
	end
	describe "parent_id is not present" do
		before { @comment.parent_id = nil }
		it { should be_valid }
	end
end
