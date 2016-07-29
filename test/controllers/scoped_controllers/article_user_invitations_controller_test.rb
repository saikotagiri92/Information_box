require 'test_helper'

class ScopedControllers::ArticleUserInvitationsControllerTest < ActionController::TestCase
  test "should get new_invitation" do
    get :new_invitation
    assert_response :success
  end

end
