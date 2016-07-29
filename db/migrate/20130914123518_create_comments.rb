class CreateComments < ActiveRecord::Migration
	def change
  	create_table :comments do |t|
    	t.integer :article_id, null: false
    	t.integer :user_id, :limit => 8, null: false
    	t.text :content, null: false
    	t.datetime :deleted_on
    	t.integer :last_updated_by, :limit => 8
    	t.integer :parent_id, :limit => 8
    	t.timestamps
  	end
	end
end
