require "test_helper"

class UserBackoffice::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_backoffice_home_index_url
    assert_response :success
  end
end
