class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.integer :organisation_id
      t.boolean :can_access_boxes_index
      t.boolean :can_access_boxes_new
      t.boolean :can_access_boxes_show
      t.boolean :can_access_boxes_edit
      t.boolean :can_access_boxes_destroy
      t.boolean :can_access_articles_new
      t.boolean :can_access_articles_edit
      t.boolean :can_access_articles_destroy
      t.boolean :can_access_comments_create
      t.boolean :can_access_comments_edit
      t.boolean :can_access_comments_destroy

      t.timestamps null: false
    end
  end
end
