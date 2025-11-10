require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    @invitation = invitations(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get account_invitations_url(@account)
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_account_invitation_url(@account)
    assert_response :success
  end

  test "should create invitation" do
    sign_in users(:one)
    assert_difference("Invitation.count") do
      post account_invitations_url(@account), params: { invitation: { account_id: @invitation.account_id, message: @invitation.message, receiver: @invitation.receiver, sender_id: @invitation.sender_id, token: @invitation.token } }
    end

    assert_redirected_to accounts_invitations_url(@account, Invitation.last)
  end

  test "should show inivitation" do
    sign_in users(:one)
    get account_invitation_url(@account, @invitation)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_account_invitation_url(@account, @invitation)
    assert_response :success
  end

  test "should update inivitation" do
    sign_in users(:one)
    p @account
    patch account_invitation_url(@account, @invitation), params: { invitation: { account_id: @invitation.account_id, message: @invitation.message, receiver: @invitation.receiver, sender_id: @invitation.sender_id, token: @invitation.token } }
    assert_redirected_to account_invitation_url(@account, @invitation)
  end

  test "should destroy invitation" do
    sign_in users(:one)
    assert_difference("Invitation.count", -1) do
      delete account_invitation_url(@account, @invitation)
    end

    assert_redirected_to invitations_url
  end
end
