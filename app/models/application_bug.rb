class ApplicationBug < ActiveRecord::Base


	#----------------------------Server Side Validations---------------------------------------
	validates :bug_details, presence: true
	validates :bug_raised_from_ip, presence: true
	validates :bug_raised_from_platform, presence: true
end
