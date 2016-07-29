class ApplicationBugsController < ApplicationController

	#----------------------Application Bug Create---------------------------
	def create
		@application_bug = ApplicationBug.new(application_bug_params)
		if @application_bug.save
			notice_message = "Bug raised successfully."
			ApplicationBugMailer.application_bug(@application_bug).deliver
		end
		redirect_to request.referer, :notice => notice_message
	end

	private 
	def application_bug_params
		params.require(:application_bug).permit(:bug_raised_by, :bug_details, :bug_raised_from_ip, :bug_raised_from_platform)
	end
end
