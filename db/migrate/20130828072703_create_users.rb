class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t| 
      
      t.string :name, null: false
      t.text :bio
      t.string :designation
      t.string :linkedin_profile_link
      t.string :facebook_profile_link
      t.string :twitter_profile_link
      t.boolean :admin, null: false, default: false
      t.boolean :active, null: false, default: false
      t.timestamps
    end
  end
  
end
