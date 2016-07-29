class AddTimeZoneToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :time_zone, :string
  end
end
