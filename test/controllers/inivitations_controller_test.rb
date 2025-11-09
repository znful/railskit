require "test_helper"

class InivitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inivitation = inivitations(:one)
  end

  test "should get index" do
    get inivitations_url
    assert_response :success
  end

  test "should get new" do
    get new_inivitation_url
    assert_response :success
  end

  test "should create inivitation" do
    assert_difference("Inivitation.count") do
      post inivitations_url, params: { inivitation: { account_id: @inivitation.account_id, message: @inivitation.message, receiver: @inivitation.receiver, sender_id: @inivitation.sender_id, token: @inivitation.token } }
    end

    assert_redirected_to inivitation_url(Inivitation.last)
  end

  test "should show inivitation" do
    get inivitation_url(@inivitation)
    assert_response :success
  end

  test "should get edit" do
    get edit_inivitation_url(@inivitation)
    assert_response :success
  end

  test "should update inivitation" do
    patch inivitation_url(@inivitation), params: { inivitation: { account_id: @inivitation.account_id, message: @inivitation.message, receiver: @inivitation.receiver, sender_id: @inivitation.sender_id, token: @inivitation.token } }
    assert_redirected_to inivitation_url(@inivitation)
  end

  test "should destroy inivitation" do
    assert_difference("Inivitation.count", -1) do
      delete inivitation_url(@inivitation)
    end

    assert_redirected_to inivitations_url
  end
end
