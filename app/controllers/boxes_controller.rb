class BoxesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!

	before_filter :set_box, except: :create
	before_filter :aurthorize_user!, except: [:create, :update]
	
	#------------------------------Box Create Processing--------------------------
	def create
		@box = Box.new(box_params)
		if @box.save
			article = Article.create(:title => "Home", :box_id => @box.id, :author_id => current_user.id)         
			redirect_to organisation_box_url(@organisation, @box), :notice => "Box: #{@box.name} created."		
		end
	end

	def show
		@box_articles = @box.articles
		if @box_articles.present?
			redirect_to organisation_box_article_url(@organisation, @box, @box.articles.first)
		else
			redirect_to new_organisation_box_article_url(@organisation, @box)
		end
	end

	#---------------------------Box update processing--------------------------------------
	def update
		redirect_to :back, notice: 'Access Denied!' if !get_user_permission_for_action('boxes_edit')
		if @box.update_attributes(box_params)
			redirect_to organisation_box_url(@organisation, @box), :notice => "Box: #{@box.name} has been updated."
		end
	end
	
	#-------------------box-delete-------------------------------------------------
	def destroy
		@box.destroy
		redirect_to organisation_url(@organisation), :notice => "Box has been deleted."
	end

	def assign_users
		@box.users.clear
		selected_users = User.where(id: params[:box][:users].keys).to_a
		@box.users << selected_users << current_user
		redirect_to organisation_box_url(@organisation, @box), notice: 'Users assigned/removed successfully.'
	end

	#--------------------------------Private Functions-----------------------------------
	private
	def set_box
		@box = Box.find_by(id: params[:id] || params[:box_id])
		redirect_to organisation_url(@organisation), notice: "Invalid Box ID: #{params[:box_id]}" if @box.nil?
	end

	def box_params
		params.require(:box).permit(:name, :description, :created_by, :last_updated_by, :organisation_id)
	end
end
