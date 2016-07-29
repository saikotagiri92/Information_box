require 'spec_helper'

describe ArticleTag do
	describe "article_tag_create" do
		it "should get correct arguements" do
			article_tag_names = "tag"
			article_id = 1
		 	article_id, article_tag_ids, article_tags = ArticleTag.article_tag_create(article_id, article_tag_names)
		 	article_tags.should == "tag"
			article_id.should == 1
		end

		it "should create & return article tag entry id" do
			article_tag_names = "tag; tag2"
			article_id = 1
		 	article_id, article_tag_ids, article_tags = ArticleTag.article_tag_create(article_id, article_tag_names)
		 	article_tag_ids.should_not == nil
		end
	end
		
	before do 
		@article_tag = ArticleTag.new(:tag_name => "tag", :article_id => 1)
	end

	subject { @article_tag }

	it { should respond_to(:tag_name) }
	it { should respond_to(:article_id) }

	describe "when tag_name is not present" do
        before { @article_tag.tag_name  = nil }
        it { should_not be_valid }
    end
    describe "when tag_name is present" do
        before { @article_tag.tag_name  = "tag" }
        it { should be_valid }
    end

    describe "when article_id is not present" do
        before { @article_tag.article_id  = nil }
        it { should_not be_valid }
    end
    describe "when article_id is present" do
        before { @article_tag.article_id  = 1 }
        it { should be_valid }
    end
end