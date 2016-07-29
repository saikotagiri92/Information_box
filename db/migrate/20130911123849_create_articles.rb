class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.integer :author_id, :limit => 8, null: false
      t.text :content, null: false
      t.integer :last_updated_by, :limit => 8
      t.integer :parent_id, :limit => 8
      t.integer :box_id, :limit => 8, null: false

      t.timestamps
    end
  end
end
