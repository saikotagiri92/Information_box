class UserInvitationMailer < ActionMailer::Base

  	def article_invitation(sender, article, recipient)
  		@sender = sender
      @article = article
      mail :to => recipient, :subject => "Article invitation" 
  	end

    #-------------------Organisation user invitatin mail------------------------
  	def organisation_invitation(user, org, new_user)
      @user = user
      @new_user = new_user
  		@org = org
  		mail :to => @user.email, :subject => "Your new Information Box account"
  	end
end
