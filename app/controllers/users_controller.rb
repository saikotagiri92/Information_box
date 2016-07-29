class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token
    before_filter :authenticate_user!, except: :user_feedback_create
    before_filter :can_access_admin_pages, except: :user_feedback_create
	before_filter :set_user, except: :user_feedback_create

	def toggle_active_privileges
		redirect_to people_organisation_url, :notice => "You can't lock your own account" if @user == current_user
		if @user.update({:active => !@user.active})
			NotificationMailer.account_activation_or_deactivation_mail(@user).deliver
			redirect_to people_organisation_url, :notice => 'User updated successfully.'
		end
	end

	def toggle_admin_privileges
		if @user.update({:admin => !@user.admin})
			NotificationMailer.admin_privileges_toggle_notification(@user).deliver
			redirect_to people_organisation_url, :notice => 'User updated successfully.'
		end
	end

	def assign_role
		@user.update_attribute(:role_id, params[:user][:role_id])
		redirect_to people_organisation_url(@organisation), notice: "Role assigned to user successfully."
	end

	#------------------------User's Feedback POST---------------------------
	def user_feedback_create
		params[:user_feedback][:user_agent] = request.user_agent
		params[:user_feedback][:user_organisation] = current_user.try(:organisation).try(:name)
		params[:user_feedback][:user_email] = current_user.email if user_signed_in?
		user_feedback_params = params[:user_feedback].clone
		UserFeedbackMailer.user_feedback(user_feedback_params).deliver
		redirect_to request.referer, :notice => "Your feedback has been sent successfully."
	end
	

	private 
	def user_params
		params.require(:user).permit(:role_id)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
