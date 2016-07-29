json.array!(@roles) do |role|
  json.extract! role, :id, :name, :description, :organisation_id, :can_access_boxes_index, :can_access_boxes_show, :can_access_boxes_edit, :can_access_boxes_destroy, :can_access_articles_show, :can_access_articles_edit, :can_access_articles_destroy, :can_access_comments_create, :can_access_comments_edit, :can_access_comments_destroy
  json.url role_url(role, format: :json)
end
