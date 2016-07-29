require 'spec_helper'

describe Article do
	
	describe "New Article Title Computation" do
		describe "When required parameters are received" do
			it "should return the computed article title" do
				organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
				box_id =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+')).id
				article1 = article1_id = Article.create(:article_title => "Home", :box_id => box_id, :created_by => 1, :article_url_title => "Home".gsub(/[^0-9A-Za-z]/, '+'))
				article2 = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home1".gsub(/[^0-9A-Za-z]/, '+'))
				article3 = Article.create(:article_title => "Home2", :box_id => box_id, :created_by => 1, :article_url_title => "Home2".gsub(/[^0-9A-Za-z]/, '+'))
				new_article_title = Article.article_title_computation(article1.article_title, box_id)
				new_article_title.should_not == nil
			end
			
			describe "when an article is already present in the box with the given article_title" do
				describe "when given article_title doesn't have last as numerical" do
					it "should return the new article title with last digit as numerical one" do
						organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
						box_id =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+')).id
						article1 = article1_id = Article.create(:article_title => "Home", :box_id => box_id, :created_by => 1, :article_url_title => "Home".gsub(/[^0-9A-Za-z]/, '+'))
						#article2 = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home1".gsub(/[^0-9A-Za-z]/, '+'))
						#article3 = Article.create(:article_title => "Home2", :box_id => box_id, :created_by => 1, :article_url_title => "Home2".gsub(/[^0-9A-Za-z]/, '+'))
						new_article_title = Article.article_title_computation(article1.article_title, box_id)
						new_article_title.should == article1.article_title + 1.to_s

					end
				end
			end

			describe "when an article is already present in the box with the given article_title" do
				describe "when given article_title have last as numerical" do
					it "should return the new article title with last digit as numerical successor" do
						organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
						box_id =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+')).id
						article1 = article1_id = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home".gsub(/[^0-9A-Za-z]/, '+'))
						#article2 = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home1".gsub(/[^0-9A-Za-z]/, '+'))
						#article3 = Article.create(:article_title => "Home2", :box_id => box_id, :created_by => 1, :article_url_title => "Home2".gsub(/[^0-9A-Za-z]/, '+'))
						new_article_title = Article.article_title_computation(article1.article_title, box_id)
						new_article_title.should == article1.article_title.succ
					end
				end
			end

			describe "when an article is already present in the box with the computed article_title" do
				it "should return the new article title with last digit as numerical successor" do
					organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
					box_id =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+')).id
					article1 = article1_id = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home".gsub(/[^0-9A-Za-z]/, '+'))
					article2 = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home1".gsub(/[^0-9A-Za-z]/, '+'))
					#article3 = Article.create(:article_title => "Home2", :box_id => box_id, :created_by => 1, :article_url_title => "Home2".gsub(/[^0-9A-Za-z]/, '+'))
					new_article_title = Article.article_title_computation(article1.article_title, box_id)
					new_article_title.should_not == article1.article_title.succ.succ
				end
			end
		end

		describe "when required parameters are not received" do
			describe "when article_title is not received" do
				it "shouldn't return the new article title" do
					organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
					box_id =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+')).id
					article_title = nil
					#article1 = article1_id = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home".gsub(/[^0-9A-Za-z]/, '+'))
					#article2 = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home1".gsub(/[^0-9A-Za-z]/, '+'))
					#article3 = Article.create(:article_title => "Home2", :box_id => box_id, :created_by => 1, :article_url_title => "Home2".gsub(/[^0-9A-Za-z]/, '+'))
					new_article_title = Article.article_title_computation(article_title, box_id)
					new_article_title.should == nil
				end
			end

			describe "when article_title is not received" do
				it "shouldn't return the new article title" do
					organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
					box_id = nil
					article1 = article1_id = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home".gsub(/[^0-9A-Za-z]/, '+'))
					#article2 = Article.create(:article_title => "Home1", :box_id => box_id, :created_by => 1, :article_url_title => "Home1".gsub(/[^0-9A-Za-z]/, '+'))
					#article3 = Article.create(:article_title => "Home2", :box_id => box_id, :created_by => 1, :article_url_title => "Home2".gsub(/[^0-9A-Za-z]/, '+'))
					new_article_title = Article.article_title_computation(article1.article_title, box_id)
					new_article_title.should == nil
				end
			end

			describe "when both parameters are not received" do
				it "shouldn't return the new article title" do
					article_title = nil
					box_id = nil
					new_article_title = Article.article_title_computation(article_title, box_id)
					new_article_title.should == nil
				end
			end
		end
	end
	before do
		@article = Article.new(:article_title => "Ruby on Rails", :article_content => 'This is a programming language', :created_by => 1, :deleted_on => "#{Date.today}", :deleted_by => 1, :last_updated_by => 1, :box_id => 1, :parent_id => nil,:article_url_title => 'Ruby+on+Rails') 
	end
	
	subject { @article}

	it { should respond_to(:article_title) }
	it { should respond_to(:article_content) }
	it { should respond_to(:created_by) }
	it { should respond_to(:deleted_on) }
	it { should respond_to(:deleted_by) }
	it { should respond_to(:last_updated_by) }
	it { should respond_to(:box_id) }
	it { should respond_to(:parent_id) }
	it { should respond_to(:article_url_title) }

	describe "when article_title is present" do
		before { @article.article_title = 'Mantraventures' }
		it { should be_valid }
	end
	describe "when article_title is not present" do
		before { @article.article_title = nil }
		it { should_not be_valid }
	end

	describe "when box_name length is more than 250 characters" do
		before { @article.article_title = 'a' * 251 }
		it { should_not be_valid }
	end

	describe "when article_title length is less than 251 characters" do
		before { @article.article_title = 'a' * 249 }
		it { should be_valid }
	end

	describe "when article_content is present" do
		before { @article.article_content = 'Mantraventures' }
		it { should be_valid }
	end
	describe "when article_content is not present" do
		before { @article.article_content = nil }
		it { should be_valid }
	end

	describe "when created_by is present" do
		before { @article.created_by =  1 }
		it { should be_valid }
	end
	describe "when created_by is not present" do
		before { @article.created_by = nil }
		it { should_not be_valid }
	end

	describe "when last_updated_by is present" do
		before { @article.last_updated_by =  1 }
		it { should be_valid }
	end
	describe "when last_updated_by is not present" do
		before { @article.last_updated_by = nil }
		it { should be_valid }
	end

	describe "when deleted_by is present" do
		before { @article.deleted_by =  1 }
		it { should be_valid }
	end
	describe "when deleted_by is not present" do
		before { @article.deleted_by = nil }
		it { should be_valid }
	end

	describe "when box_id is present" do
		before { @article.box_id =  1 }
		it { should be_valid }
	end
	describe "when box_id is not present" do
		before { @article.box_id = nil }
		it { should_not be_valid }
	end

	describe "when deleted_on is present" do
		before { @article.deleted_on =  Date.today }
		it { should be_valid }
	end
	describe "when deleted_on is not present" do
		before { @article.deleted_on = nil }
		it { should be_valid }
	end

	describe "when parent_id is present" do
		before { @article.parent_id =  nil }
		it { should be_valid }
	end
	describe "when parent_id is not present" do
		before { @article.parent_id = nil }
		it { should be_valid }
	end

	describe "when article_url_title is present" do
		before { @article.article_url_title = 'Mantraventures+Ltd' }
		it { should be_valid }
	end
	describe "when article_url_title is not present" do
		before { @article.article_url_title = nil }
		it { should_not be_valid }
	end
end