class AddPasswordResetFromIpAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_from_ip_address, :string
  end
end
