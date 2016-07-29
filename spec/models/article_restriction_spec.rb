require 'spec_helper'

describe ArticleRestriction do
	describe "User restriction for an article in a box" do
		describe "when user restriction type for an article is received" do
			describe "when an entry in the article_restrictions with the given restriction: view restrictions is not present" do
				it "should create an entry in the table & return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end

			describe "when an entry in the article_restrictions with the given restriction: edit restrictions is not present" do
				it "should create an entry in the table & return the restriction entry id with the restriction type" do
					restriction_type = "edit restrictions"
					article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
					restriction_type.should == "edit restrictions"
				end
			end

			describe "when an entry in the article_restrictions with the given restriction: no restrictions is not present" do
				it "should create an entry in the table & return the restriction entry id with the restriction type" do
					restriction_type = "no restrictions"
					article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
					restriction_type.should == "no restrictions"
				end
			end

			describe "when an entry in the article_restrictions with the given restriction: view restrictions is present" do
				it "should return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end

			describe "when an entry in the article_restrictions with the given restriction: edit restrictions is present" do
				it "should return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end

			describe "when an entry in the article_restrictions with the given restriction: no restrictions is present" do
				it "should return the restriction entry id with the restriction type" do
					restriction_type = "view restrictions"
					article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
					restriction_type.should == "view restrictions"
				end
			end
		end
		describe "when user restriction type for an article is not received" do
			it "should return the restriction entry id with the restriction type" do
				restriction_type = nil
				article_restriction_type_id, restriction_type = ArticleRestriction.article_restriction_type_id(restriction_type)
				article_restriction_type_id.should == nil
				restriction_type.should == nil
			end
		end
	end

	before do 
		@article_restriction = ArticleRestriction.new(:restriction_type => "view restrictions", :restriction_description => "An user can view any article in a box")
	end

	subject { @article_restriction }

	it {should respond_to(:restriction_type)}
	it {should respond_to(:restriction_description)}

	describe "when restriction_type is present" do
		before { @article_restriction.restriction_type = 'view restrictions' }
		it { should be_valid }
	end
	describe "when restriction_type is not present" do
		before { @article_restriction.restriction_type = nil }
		it { should_not be_valid }
	end

	describe "when restriction_description is present" do
		before { @article_restriction.restriction_description = 'An user can view any article in a box' }
		it { should be_valid }
	end
	describe "when restriction_description is not present" do
		before { @article_restriction.restriction_description = nil }
		it { should be_valid }
	end
end