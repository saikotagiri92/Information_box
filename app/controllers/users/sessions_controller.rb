class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]
before_filter :account_active_check, only: [:create]

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end

  def account_active_check
    user = User.find_by_email(params[:user][:email])
    account_inactive_message = "Your account is inactive and is now pending administrator's approval."
    redirect_to new_user_session_path, notice: account_inactive_message if user.present? && !user.active
  end
end
