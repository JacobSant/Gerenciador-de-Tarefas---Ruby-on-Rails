require "test_helper"

class UserBackoffice::ListSharedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_backoffice_list_shared = user_backoffice_list_shareds(:one)
  end

  test "should get index" do
    get user_backoffice_list_shareds_url
    assert_response :success
  end

  test "should get new" do
    get new_user_backoffice_list_shared_url
    assert_response :success
  end

  test "should create user_backoffice_list_shared" do
    assert_difference("UserBackoffice::ListShared.count") do
      post user_backoffice_list_shareds_url, params: { user_backoffice_list_shared: { task_id: @user_backoffice_list_shared.task_id, user_id: @user_backoffice_list_shared.user_id } }
    end

    assert_redirected_to user_backoffice_list_shared_url(UserBackoffice::ListShared.last)
  end

  test "should show user_backoffice_list_shared" do
    get user_backoffice_list_shared_url(@user_backoffice_list_shared)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_backoffice_list_shared_url(@user_backoffice_list_shared)
    assert_response :success
  end

  test "should update user_backoffice_list_shared" do
    patch user_backoffice_list_shared_url(@user_backoffice_list_shared), params: { user_backoffice_list_shared: { task_id: @user_backoffice_list_shared.task_id, user_id: @user_backoffice_list_shared.user_id } }
    assert_redirected_to user_backoffice_list_shared_url(@user_backoffice_list_shared)
  end

  test "should destroy user_backoffice_list_shared" do
    assert_difference("UserBackoffice::ListShared.count", -1) do
      delete user_backoffice_list_shared_url(@user_backoffice_list_shared)
    end

    assert_redirected_to user_backoffice_list_shareds_url
  end
end
