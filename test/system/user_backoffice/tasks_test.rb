require "application_system_test_case"

class UserBackoffice::TasksTest < ApplicationSystemTestCase
  setup do
    @user_backoffice_task = user_backoffice_tasks(:one)
  end

  test "visiting the index" do
    visit user_backoffice_tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit user_backoffice_tasks_url
    click_on "New task"

    fill_in "Description", with: @user_backoffice_task.description
    fill_in "Priority", with: @user_backoffice_task.priority
    fill_in "Shared", with: @user_backoffice_task.shared
    fill_in "Status", with: @user_backoffice_task.status
    fill_in "Title", with: @user_backoffice_task.title
    fill_in "User", with: @user_backoffice_task.user_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit user_backoffice_task_url(@user_backoffice_task)
    click_on "Edit this task", match: :first

    fill_in "Description", with: @user_backoffice_task.description
    fill_in "Priority", with: @user_backoffice_task.priority
    fill_in "Shared", with: @user_backoffice_task.shared
    fill_in "Status", with: @user_backoffice_task.status
    fill_in "Title", with: @user_backoffice_task.title
    fill_in "User", with: @user_backoffice_task.user_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit user_backoffice_task_url(@user_backoffice_task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
