class UserInvitationsController < ApplicationController
	before_action :authenticate_user!
	
	def article_invitation
		article = Article.find(params[:id])
		recipient = params[:article_invitation][:recipient_email]
		if @organisation.users.map(&:email).include?(recipient)
			UserInvitationMailer.article_invitation(current_user, article, recipient).deliver
			redirect_to :back, notice: "Invitation sent successfully."
		else
			redirect_to :back, notice: "Recipient: #{recipient} is not a member of the organisation."
		end
	end

	def organisation_invitation
		new_user = User.create(user_params)
		if new_user.persisted?
			UserInvitationMailer.organisation_invitation(current_user, @organisation, new_user).deliver
			redirect_to :back, notice: 'Invitation sent successfully.'
		else
			redirect_to :back, notice: "Invitation sending failed due as #{new_user.errors.full_messages.join(', ')}."
		end
	end

	private
	def user_params
		pass = "newuser123"
		params[:org_invitation].merge!({password: pass, password_confirmation: pass})
		params.require(:org_invitation).permit(:name, :email, :password, :password_confirmation, :admin, :active, :organisation_id)
	end
end
