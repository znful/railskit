require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:one)
    get account_dashboard_url(accounts(:one).slug)
    assert_response :success
  end
end
