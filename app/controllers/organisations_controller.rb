class OrganisationsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
	before_filter :can_access_admin_pages, except: :show 
	def show
		redirect_to organisation_url(current_user.organisation) if params[:id].nil?
	end

	def destroy
		#deletion of organisation
		organisation =  Organisation.find_by_id(params[:organisation_id])
		if organisation !=nil
			organisation.destroy

			flash[:notice] = "Organisation deleted successfully."
			redirect_to app_control_centre_path
		else
			flash[:notice] = "Organisation with id: #{params[:organisation_id]} doesn't exists."
			redirect_to app_control_centre_path
		end
	end

	#--------------------------Organisation settings page-------------------------------
	def edit
	end

	#--------------------------Organisation settings update-------------------------------
	def update
		@organisation.update_attributes(organisation_params)
		respond_to do |format|
			format.html
			format.js
		end
	end

	#--------------------------Organisation People Settings-------------------------------
	def people
		WillPaginate.per_page = 10
		@roles = @organisation.roles
		@organisation_people = @organisation.users.paginate(:page => params[:page], :per_page => 10)
	end 

	#--------------------------Private Functions-------------------------------
	private
	def organisation_params
		params.require(:organisation).permit(:name, :owner_id, :address_line_1, :address_line_2, :pin_code, :city, :state, :country, :phone_number_1, :phone_number_2, :email_address_1, :email_address_2, :contact_person, :time_zone, :description)
	end
	
	def organisation_new_params
		params[:organisation][:owner_id] = current_user.id
		organisation_name = params[:organisation][:name]
		params.require(:organisation).permit(:name, :owner_id)
	end
end
