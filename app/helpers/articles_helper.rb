module ArticlesHelper

	#-------------------------it checks if the article with article_url_name from the url exists in the current box or not
	def article_existence
		@article = Article.find_by_article_url_title_and_box_id(params[:article_url_title], @box.id)
		if @article.nil?
			flash[:notice] = "Article: #{params[:article_url_title]} doesn't exists."
			redirect_to box_show_url(current_organisation.subdomain, @box.box_url_name)
		else
		end
	end

	def article_form_method_name_and_submit_button_name
		if params[:action] == "article_new"
			return post_method_name = article_create_url(current_organisation.subdomain, @box.box_url_name), submit_button_name = "Save Article"
		else
			return post_method_name = article_update_url(current_organisation.subdomain, @box.box_url_name, @article.article_url_title), submit_button_name = "Update Article"
		end
	end	

	def nested_articles(articles)
		articles.map do |article, child_articles|
			
			if child_articles != {}
				content_tag(:li, (content_tag(:span, link_to(article.title, organisation_box_article_url(@organisation, article.box, article)), class: "file") + content_tag(:ul, nested_articles(child_articles))))
			else
				content_tag(:li, (content_tag(:span, link_to(article.title, organisation_box_article_url(@organisation, article.box, article)), class: "file" )))
			end
		end.join.html_safe
	end

	def assign_users_grouping(users)
    return 1 if users.blank?
    half_users = users.count / 2
    users.count == 1 ? 1 : (users.count.odd? ? half_users+1 : half_users)
  	
  end

  def fetch_users_for_box_assignment
  	org_users = @organisation.users.to_a
  	org_users.delete(current_user)
  	org_users.delete(@organisation.owner)
  	org_users
  end
end
