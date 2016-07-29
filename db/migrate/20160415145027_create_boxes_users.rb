class CreateBoxesUsers < ActiveRecord::Migration
  def change
    create_table :boxes_users do |t|
      t.integer :box_id
      t.integer :user_id
    end
  end
end
