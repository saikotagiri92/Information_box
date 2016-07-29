class TextFieldsLimitIncrease < ActiveRecord::Migration
  	def change
  		if !Rails.env.production?
  			execute "alter table articles modify content LONGTEXT;"
  			execute "alter table organisations modify description LONGTEXT;"
  			execute "alter table comments modify content LONGTEXT;"
  			execute "alter table users modify bio LONGTEXT;"
  		end
  	end
end
