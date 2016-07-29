class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      
      t.string :name, null: false
      t.text :description
      t.integer :owner_id, :limit => 8, null: false
      t.string :address_line_1  
     	t.string :address_line_2
     	t.string :city
     	t.string :pin_code
     	t.string :state
     	t.string :country
  		t.string :phone_number_1
  		t.string :phone_number_2
  		t.string :email_address_1
  		t.string :email_address_2
  		t.string :contact_person
      t.timestamps
    end
  end
end
