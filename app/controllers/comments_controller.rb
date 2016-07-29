class CommentsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!

	before_filter :set_box
	before_filter :set_article
	before_filter :aurthorize_user!, only: [:create, :edit, :destroy]

	before_filter :set_comment, except: :create

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			respond_to do |format|
			    format.js 
			end
		end
	end

	def edit		
		respond_to do |format|
			format.js 
		end
	end

	

	def update
		if @comment.update_attributes(comment_params)
			respond_to do |format|
				format.js 
			end
		end
	end

	#---------------------------------Comment Delete-----------------------------
	def destroy
		@comment.destroy
		respond_to do |format|
			format.js 
		end
	end

	private
	#rails protected attributes method
	def comment_params
		params[:comment][:article_id] = params[:article_id]
		params.require(:comment).permit(:user_id, :article_id, :content, :deleted_on, :deleted_by, :last_updated_by, :parent_id)
	end

	def set_article
		@article = Article.eager_load(:box).where(id: params[:article_id], box_id: params[:box_id]).first
	end

	def set_comment
		@comment = Comment.find_by(id: params[:id], article_id: @article.id)
	end

	def set_box
		@box = Box.find_by(id: params[:box_id])
		redirect_to organisation_url(@organisation), notice: "Invalid Box ID: #{params[:box_id]}" if @box.nil?
	end
end
