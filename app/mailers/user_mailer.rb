class UserMailer < ActionMailer::Base
    
  #-------------------------Welcome mail to new user----------------------
  def welcome_message(user, organisation)
  	@user = user
    @organisation = organisation
  	mail :to => @user.email, :subject => "Welcome to #{organisation.name}'s Information Box.."
  end
end
