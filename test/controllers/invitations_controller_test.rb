require "test_helper"

class InivitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    @invitation = invitations(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get account_inivitations_url(@account)
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_account_inivitation_url(@account)
    assert_response :success
  end

  test "should create inivitation" do
    sign_in users(:one)
    assert_difference("Inivitation.count") do
      post account_invitations_url(@account), params: { inivitation: { account_id: @inivitation.account_id, message: @inivitation.message, receiver: @inivitation.receiver, sender_id: @inivitation.sender_id, token: @inivitation.token } }
    end

    assert_redirected_to accounts_inivitation_url(accountsInivitation.last)
  end

  test "should show inivitation" do
    get account_inivitation_url(@account, @inivitation)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_inivitation_url(@account, @inivitation)
    assert_response :success
  end

  test "should update inivitation" do
    patch account_inivitation_url(@account, @inivitation), params: { inivitation: { account_id: @inivitation.account_id, message: @inivitation.message, receiver: @inivitation.receiver, sender_id: @inivitation.sender_id, token: @inivitation.token } }
    assert_redirected_to account_inivitation_url(@account, @inivitation)
  end

  test "should destroy inivitation" do
    assert_difference("Inivitation.count", -1) do
      delete account_inivitation_url(@account, @inivitation)
    end

    assert_redirected_to inivitations_url
  end
end
