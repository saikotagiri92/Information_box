
class ArticlesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	
	before_filter :set_box
	before_filter :set_article, only: ["edit", "update", "destroy", "show"]
	before_filter :aurthorize_user!, only: [:new, :edit, :destroy]

	before_filter :authenticate_user!

	#------------------New Article Form---------------------------------------
	def new
		@article = Article.new(box_id: params[:box_id], author_id: current_user.id)
	end

	#------------------New Article Creation----------------------------------
	def create
		@article = Article.new(article_params)
		if @article.save
			
			redirect_to organisation_box_article_url(@organisation, @box, @article), :notice => "Article: #{@article.title} created."
		end
	end

	#------------------Article Edit Form-----------------------------------
	def edit
	end

	#------------------Article Update-------------------
	def update
		if @article.update_attributes(article_params)
			@box.update_attributes(:updated_at => Time.now, :last_updated_by => current_user.id)
			redirect_to organisation_box_article_url(@organisation, @box, @article), :notice => "Article: #{@article.title} has been updated."				
		end
	end

	#------------------this displays the requested article-------------------
	def show
		@comment = Comment.new(user_id: current_user.id, article_id: @article.id)
	end

	def destroy
		@box.update_attributes(:updated_at => Time.now, :last_updated_by => current_user.id)		
		@article.destroy
		redirect_to organisation_box_url(@organisation.id, params[:box_id]), :notice => "Article has been deleted." 
	end

	
	private
	def set_box
		@box = Box.find_by(id: params[:box_id])
		redirect_to organisation_url(@organisation), notice: 'Invalid Box ID' if @box.nil?
	end

	def article_params
		params.require(:article).permit(:title, :content, :author_id, :deleted_by, :deleted_on, :last_updated_by, :box_id, :parent_id)
	end

	def set_article
		@article = Article.eager_load(:box, comments: :user).where(box_id: params[:box_id], id: params[:id]).first
		redirect_to organisation_box_url(@organisation, @box), notice: 'Invalid Article ID' if @article.nil?
	end
end
