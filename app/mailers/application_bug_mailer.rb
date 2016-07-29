class ApplicationBugMailer < ActionMailer::Base

  	def application_bug(application_bug)
  		@application_bug = application_bug
  		recipients = ["goel.nishant.2014@gmail.com"].join(",")
      	mail :to => recipients, :subject => "Application Bug"
  	end
end

