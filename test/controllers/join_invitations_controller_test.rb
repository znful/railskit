require "test_helper"

class JoinInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get join_invitations_index_url
    assert_response :success
  end

  test "should get create" do
    get join_invitations_create_url
    assert_response :success
  end
end
