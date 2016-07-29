class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :organisation_id, :limit => 8, null: false
      t.string :name, null: false
      t.string :description
      t.integer :created_by, :limit => 8
      t.integer :last_updated_by, :limit => 8

      t.timestamps
      
    end
  end
end
