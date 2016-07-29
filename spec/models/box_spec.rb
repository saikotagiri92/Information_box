require 'spec_helper'

describe Box do
	
	describe "New Box Name Computation" do
		describe "When required parameters are received" do
			it "should return the computed box name" do
				organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
				box1 =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+'))
				new_box_name = Box.box_name_computation(box1.box_name, organisation_id)
				new_box_name.should_not == nil
			end
			
			describe "when an article is already present in the box with the given box_name" do
				describe "when given box_name doesn't have last as numerical" do
					it "should return the new box name with last digit as numerical one" do
						organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
						box1 =Box.create(:box_name => "Default Box", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box".gsub(/[^0-9A-Za-z]/, '+'))
						new_box_name = Box.box_name_computation(box1.box_name, organisation_id)
						new_box_name.should == box1.box_name + 1.to_s

					end
				end
			end

			describe "when an article is already present in the box with the given box_name" do
				describe "when given box_name have last as numerical" do
					it "should return the new box name with last digit as numerical successor" do
						organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
						box1 =Box.create(:box_name => "Default Box1", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box1".gsub(/[^0-9A-Za-z]/, '+'))
						new_box_name = Box.box_name_computation(box1.box_name, organisation_id)
						new_box_name.should == box1.box_name.succ
					end
				end
			end

			describe "when an article is already present in the box with the computed box_name" do
				it "should return the new box name with last digit as numerical successor" do
					organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
					box1 =Box.create(:box_name => "Default Box1", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box1".gsub(/[^0-9A-Za-z]/, '+'))
					box1 =Box.create(:box_name => "Default Box2", :organisation_id => organisation_id, :created_by => 1, :box_url_name => "Default Box2".gsub(/[^0-9A-Za-z]/, '+'))
					new_box_name = Box.box_name_computation(box1.box_name, organisation_id)
					new_box_name.should_not == box1.box_name.succ.succ
				end
			end
		end

		describe "when required parameters are not received" do
			describe "when box_name is not received" do
				it "shouldn't return the new box name" do
					organisation_id = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person").id
					box_name = nil
					new_box_name = Box.box_name_computation(box_name, organisation_id)
					new_box_name.should == nil
				end
			end

			describe "when organisation_id is not received" do
				it "shouldn't return the new box name" do
					organisation_id = nil
					box1 = nil
					new_box_name = Box.box_name_computation(box1, organisation_id)
					new_box_name.should == nil
				end
			end

			describe "when both parameters are not received" do
				it "shouldn't return the new box name" do
					box_name = nil
					organisation_id = nil
					new_box_name = Box.box_name_computation(box_name, organisation_id)
					new_box_name.should == nil
				end
			end
		end
	end
	before do
		@box = Box.new(:organisation_id => 1, :box_name => "Technology_box", :box_description => "This box contains all the articles related to technologies", :created_by => 1, :last_updated_by => nil, :box_url_name => "Technology+box")
	end

	subject { @box }

	it {should respond_to(:organisation_id) }
	it {should respond_to(:box_name) }
	it {should respond_to(:box_description) }
	it {should respond_to(:created_by) }
	it {should respond_to(:last_updated_by) }
	it {should respond_to(:box_url_name)}

	describe "when box_name is present" do
		before { @box.box_name = 'Mantraventures' }
		it { should be_valid }
	end
	describe "when box_name is not present" do
		before { @box.box_name = nil }
		it { should_not be_valid }
	end

	describe "when box_name length is more than 100 characters" do
		before { @box.box_name = 'a' * 101 }
		it { should_not be_valid }
	end

	describe "when box_name length is less than 100 characters" do
		before { @box.box_name = 'a' * 99 }
		it { should be_valid }
	end

	describe "when box_description is present" do
		before { @box.box_description = 'Mantraventures' }
		it { should be_valid }
	end
	describe "when box_description is not present" do
		before { @box.box_description = nil }
		it { should be_valid }
	end

	describe "when box_description length is more than 160 characters" do
		before { @box.box_description = 'a' * 161 }
		it { should_not be_valid }
	end

	describe "when box_description length is less than 160 characters" do
		before { @box.box_description = 'a' * 159 }
		it { should be_valid }
	end

	describe "when organisation_id is present" do
		before { @box.organisation_id = 1 }
		it { should be_valid }
	end
	describe "when organisation_id is not present" do
		before { @box.organisation_id = nil }
		it { should_not be_valid }
	end

	describe "when created_by is present" do
		before { @box.created_by = 1 }
		it { should be_valid }
	end
	describe "when created_by is not present" do
		before { @box.created_by = nil }
		it { should_not be_valid }
	end

	describe "when last_updated_by is present" do
		before { @box.last_updated_by = 1 }
		it { should be_valid }
	end
	describe "when last_updated_by is not present" do
		before { @box.last_updated_by = nil }
		it { should be_valid }
	end

	describe "when box_url_name is present" do
		before { @box.box_url_name = 'Technology+box' }
		it { should be_valid }
	end
	describe "when box_url_name is not present" do
		before { @box.box_url_name = nil }
		it { should_not be_valid }
	end
end
