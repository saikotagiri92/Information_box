class CreateApplicationBugs < ActiveRecord::Migration
  	def change
    	create_table :application_bugs do |t|
      		t.integer :bug_raised_by, :limit => 8
      		t.text :bug_details
      		t.string :bug_raised_from_ip
      		t.string :bug_raised_from_platform
      		t.timestamps
    	end
  	end
end
