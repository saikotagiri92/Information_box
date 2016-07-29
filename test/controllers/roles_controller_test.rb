require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @role = roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post :create, role: { can_access_articles_destroy: @role.can_access_articles_destroy, can_access_articles_edit: @role.can_access_articles_edit, can_access_articles_show: @role.can_access_articles_show, can_access_boxes_destroy: @role.can_access_boxes_destroy, can_access_boxes_edit: @role.can_access_boxes_edit, can_access_boxes_index: @role.can_access_boxes_index, can_access_boxes_show: @role.can_access_boxes_show, can_access_comments_create: @role.can_access_comments_create, can_access_comments_destroy: @role.can_access_comments_destroy, can_access_comments_edit: @role.can_access_comments_edit, description: @role.description, name: @role.name, organisation_id: @role.organisation_id }
    end

    assert_redirected_to role_path(assigns(:role))
  end

  test "should show role" do
    get :show, id: @role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role
    assert_response :success
  end

  test "should update role" do
    patch :update, id: @role, role: { can_access_articles_destroy: @role.can_access_articles_destroy, can_access_articles_edit: @role.can_access_articles_edit, can_access_articles_show: @role.can_access_articles_show, can_access_boxes_destroy: @role.can_access_boxes_destroy, can_access_boxes_edit: @role.can_access_boxes_edit, can_access_boxes_index: @role.can_access_boxes_index, can_access_boxes_show: @role.can_access_boxes_show, can_access_comments_create: @role.can_access_comments_create, can_access_comments_destroy: @role.can_access_comments_destroy, can_access_comments_edit: @role.can_access_comments_edit, description: @role.description, name: @role.name, organisation_id: @role.organisation_id }
    assert_redirected_to role_path(assigns(:role))
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete :destroy, id: @role
    end

    assert_redirected_to roles_path
  end
end
