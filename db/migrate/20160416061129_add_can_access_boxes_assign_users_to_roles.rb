class AddCanAccessBoxesAssignUsersToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :can_access_boxes_assign_users, :boolean
  end
end
