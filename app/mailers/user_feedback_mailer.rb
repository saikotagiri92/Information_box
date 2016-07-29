class UserFeedbackMailer < ActionMailer::Base

  	def user_feedback(user_feedback_params)
  		@browser_info = user_feedback_params[:browser_info]
  		@user_agent = user_feedback_params[:user_agent]
  		@sender_organisation = user_feedback_params[:user_organisation]
  		@sender_email = user_feedback_params[:user_email]
  		@sender_feedback = user_feedback_params[:user_feedback]
  		recipients = ["nishant@pluralcode.com"].join(",")
      mail :to => recipients, :subject => "User Feedback"
  	end
end
