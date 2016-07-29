# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	AdminUser.delete_all
	AdminUser.create(:admin_user_name => "Arun Bansal", :admin_user_email => "arun@mantraventures.com", :password => "arun98385", :password_confirmation => "arun98385")

	