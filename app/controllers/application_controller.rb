class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	
    protect_from_forgery with: :exception
  	
    include ApplicationHelper
    include BoxesHelper
    include ArticlesHelper
    include UsersHelper
    
    before_action :configure_permitted_parameters, if: :devise_controller?       
    before_filter :set_organisation    
    before_filter :set_application_bug

    def https_redirect
        if ENV["ENABLE_HTTPS"] == "yes"
            if request.ssl? && !user_https? || !request.ssl? && use_https?
                protocol = request.ssl? ? "http" : "https"
                flash.keep
                redirect_to protocol: "#{protocol}://", status: :moved_permanently
            end
        end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :admin, :active, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :designation, :bio, :linkedin_profile_link, :facebook_profile_link, :twitter_profile_link) }
    end
    
    def can_access_admin_pages
      if !is_current_user_admin_or_owner?
        redirect_to organisation_url(@organisation), notice: 'Access Denied!'
      end
    end

    def is_current_user_org_owner?
      current_user == @organisation.owner
    end
    
    def aurthorize_user!
      return if is_current_user_org_owner?
      if @box.users.include?(current_user) && current_user.role.try(:send, "can_access_#{params[:controller]}_#{params[:action]}?") 
      else
        redirect_to organisation_url(@organisation), notice: 'Access Denied!'
      end
    end

    def set_application_bug
      @application_bug = ApplicationBug.new(bug_raised_from_platform: request.user_agent, bug_raised_from_ip: request.remote_ip, bug_raised_by: current_user.try(:id))
    end

    def set_organisation
      if user_signed_in?
        @organisation = current_user.organisation
        sign_out current_user if @organisation.nil?
        redirect_to new_user_session_path, notice: "Organisation doesn't exists." if @organisation.nil?
      end
    end

    def use_https
        true
    end

    private
  	def set_organisation_time_zone
  	
      Time.zone = current_organisation.time_zone if user_signed_in?
    end

    def default_global_user
      GlobalUser.default_user
    end
end
