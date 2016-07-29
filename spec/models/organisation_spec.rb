require 'spec_helper'

describe Organisation do 
	describe "Organisation subdomain Computation" do
		describe "When required parameters are received" do
			it "should return the computed subdomain" do
				organisation = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
				new_subomain = Organisation.organisation_subdomain_computation(organisation.subdomain)
				new_subomain.should_not == nil
			end
			
			describe "when an organisation is already present in the box with the given subdomain" do
				describe "when given subdomain doesn't have last as numerical" do
					it "should return the new subdomain with last digit as numerical one" do
						organisation = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
						new_subomain = Organisation.organisation_subdomain_computation(organisation.subdomain)
						new_subomain.should == organisation.subdomain + 1.to_s

					end
				end
			end

			describe "when an organisation is already present in the box with the given subdomain" do
				describe "when given subdomain have last as numerical" do
					it "should return the new subdomain with last digit as numerical successor" do
						organisation = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra1", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
						new_subomain = Organisation.organisation_subdomain_computation(organisation.subdomain)
						new_subomain.should == organisation.subdomain.succ
					end
				end
			end

			describe "when an organisation is already present in the box with the computed subdomain" do
				it "should return the new subdomain with last digit as numerical successor" do
					organisation = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra1", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
					organisation1 = Organisation.create(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra2", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
					new_subomain = Organisation.organisation_subdomain_computation(organisation.subdomain)
					new_subomain.should == organisation.subdomain.succ.succ
				end
			end
		end

		describe "when required parameters are not received" do
			describe "when subdomain is not received" do
				it "shouldn't return the new subdomain" do
					subdomain = nil
					new_subomain = Organisation.organisation_subdomain_computation(subdomain)
					new_subomain.should == nil
				end
			end
		end
	end
	before do
		@organisation = Organisation.new(:organisation_name => 'Mantraventures', :owner_id => 1, :subdomain => "mantra", :address_line_1 => "address_line_1", :address_line_2 => "address_line_2", :pin_code => "pin_code", :city => "city", :state => "state", :country => "country", :phone_number_1 => "phone_number_1", :phone_number_2 => "phone_number_2", :email_address_1 => "email_address_1", :email_address_2 => "email_address_2", :contact_person => "contact_person")
	end

	subject { @organisation }

	it { should respond_to(:organisation_name) }
	it { should respond_to(:owner_id) }
	it { should respond_to(:subdomain) }
	it { should respond_to(:address_line_1) }
	it { should respond_to(:address_line_2) }
	it { should respond_to(:pin_code) }
	it { should respond_to(:city) }
	it { should respond_to(:state) }
	it { should respond_to(:country) }
	it { should respond_to(:phone_number_1) }
	it { should respond_to(:phone_number_2) }
	it { should respond_to(:email_address_1) }
	it { should respond_to(:email_address_2) }
	it { should respond_to(:contact_person) }

	describe "organisation_name is present" do
		before { @organisation.organisation_name = 'Mantraventures' }
		it { should be_valid }
	end
	describe "organisation_name is not present" do
		before { @organisation.organisation_name = nil }
		it { should_not be_valid }
	end

	describe "organisation_name length is more than 250 characters" do
		before { @organisation.organisation_name = 'a' * 251 }
		it { should_not be_valid }
	end

	describe "organisation_name length is less than 250 characters" do
		before { @organisation.organisation_name = 's' * 249 }
		it { should be_valid }
	end

	describe "owner_id is present" do
		before { @organisation.owner_id = 1 }
		it { should be_valid }
	end

	describe "owner_id is not present" do
		before { @organisation.owner_id = nil }
		it { should_not be_valid }
	end

	describe "subdomain is present" do
		before { @organisation.subdomain = "mantra" }
		it { should be_valid }
	end

	describe "subdomain is not present" do
		before { @organisation.subdomain = nil }
		it { should_not be_valid }
	end

	describe "address_line_1 is present" do
		before { @organisation.address_line_1 = 'address_line_1' }
		it { should be_valid }
	end
	describe "address_line_1 is not present" do
		before { @organisation.address_line_1 = nil }
		it { should be_valid }
	end

	describe "address_line_2 is present" do
		before { @organisation.address_line_2 = 'address_line_2' }
		it { should be_valid }
	end
	describe "address_line_2 is not present" do
		before { @organisation.address_line_2 = nil }
		it { should be_valid }
	end

	describe "pin_code is present" do
		before { @organisation.pin_code = 'pin_code' }
		it { should be_valid }
	end
	describe "pin_code is not present" do
		before { @organisation.pin_code = nil }
		it { should be_valid }
	end

	describe "city is present" do
		before { @organisation.city = 'city' }
		it { should be_valid }
	end
	describe "city is not present" do
		before { @organisation.city = nil }
		it { should be_valid }
	end

	describe "state is present" do
		before { @organisation.state = 'state' }
		it { should be_valid }
	end
	describe "state is not present" do
		before { @organisation.state = nil }
		it { should be_valid }
	end

	describe "country is present" do
		before { @organisation.country = 'country' }
		it { should be_valid }
	end
	describe "country is not present" do
		before { @organisation.country = nil }
		it { should be_valid }
	end

	describe "phone_number_1 is present" do
		before { @organisation.phone_number_1 = 'phone_number_1' }
		it { should be_valid }
	end
	describe "phone_number_1 is not present" do
		before { @organisation.phone_number_1 = nil }
		it { should be_valid }
	end

	describe "phone_number_2 is present" do
		before { @organisation.phone_number_2 = 'phone_number_2' }
		it { should be_valid }
	end
	describe "phone_number_2 is not present" do
		before { @organisation.phone_number_2 = nil }
		it { should be_valid }
	end

	describe "email_address_1 is present" do
		before { @organisation.email_address_1 = 'email_address_1' }
		it { should be_valid }
	end
	describe "email_address_1 is not present" do
		before { @organisation.email_address_1 = nil }
		it { should be_valid }
	end

	describe "email_address_2 is present" do
		before { @organisation.email_address_2 = 'email_address_2' }
		it { should be_valid }
	end
	describe "email_address_2 is not present" do
		before { @organisation.email_address_2 = nil }
		it { should be_valid }
	end

	describe "contact_person is present" do
		before { @organisation.contact_person = 'contact_person' }
		it { should be_valid }
	end
	describe "contact_person is not present" do
		before { @organisation.contact_person = nil }
		it { should be_valid }
	end
end