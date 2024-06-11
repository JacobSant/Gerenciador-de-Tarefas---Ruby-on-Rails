require "test_helper"

class UserBackoffice::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_backoffice_task = user_backoffice_tasks(:one)
  end

  test "should get index" do
    get user_backoffice_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_user_backoffice_task_url
    assert_response :success
  end

  test "should create user_backoffice_task" do
    assert_difference("UserBackoffice::Task.count") do
      post user_backoffice_tasks_url, params: { user_backoffice_task: { description: @user_backoffice_task.description, priority: @user_backoffice_task.priority, shared: @user_backoffice_task.shared, status: @user_backoffice_task.status, title: @user_backoffice_task.title, user_id: @user_backoffice_task.user_id } }
    end

    assert_redirected_to user_backoffice_task_url(UserBackoffice::Task.last)
  end

  test "should show user_backoffice_task" do
    get user_backoffice_task_url(@user_backoffice_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_backoffice_task_url(@user_backoffice_task)
    assert_response :success
  end

  test "should update user_backoffice_task" do
    patch user_backoffice_task_url(@user_backoffice_task), params: { user_backoffice_task: { description: @user_backoffice_task.description, priority: @user_backoffice_task.priority, shared: @user_backoffice_task.shared, status: @user_backoffice_task.status, title: @user_backoffice_task.title, user_id: @user_backoffice_task.user_id } }
    assert_redirected_to user_backoffice_task_url(@user_backoffice_task)
  end

  test "should destroy user_backoffice_task" do
    assert_difference("UserBackoffice::Task.count", -1) do
      delete user_backoffice_task_url(@user_backoffice_task)
    end

    assert_redirected_to user_backoffice_tasks_url
  end
end
