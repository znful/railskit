require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    sign_in users(:one)
    assert_difference("Account.count") do
      post accounts_url, params: { account: { name: @account.name, owner_id: @account.owner_id, slug: @account.slug } }
    end

    assert_redirected_to account_url(Account.order(:created_at).last)
  end

  test "should show account" do
    sign_in users(:one)
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    p @account
    get account_settings(@account)
    assert_response :success
  end

  test "should update account" do
    sign_in users(:one)
    patch account_url(@account), params: { account: { name: @account.name, owner_id: @account.owner_id, slug: @account.slug } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    sign_in users(:one)
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
