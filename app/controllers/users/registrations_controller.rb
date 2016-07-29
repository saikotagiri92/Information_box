class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

  def new
    super
  end

  def create
    super do |resource|
      if resource.persisted?
        organisation = Organisation.create(name: params[:organisation][:name], owner_id: resource.id)
        resource.update_attribute("organisation_id", organisation.id)
        UserMailer.welcome_message(resource, organisation).deliver
      end
    end
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end


  def cancel
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :attribute
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
