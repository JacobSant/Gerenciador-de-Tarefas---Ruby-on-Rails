require "application_system_test_case"

class UserBackoffice::ListSharedsTest < ApplicationSystemTestCase
  setup do
    @user_backoffice_list_shared = user_backoffice_list_shareds(:one)
  end

  test "visiting the index" do
    visit user_backoffice_list_shareds_url
    assert_selector "h1", text: "List shareds"
  end

  test "should create list shared" do
    visit user_backoffice_list_shareds_url
    click_on "New list shared"

    fill_in "Task", with: @user_backoffice_list_shared.task_id
    fill_in "User", with: @user_backoffice_list_shared.user_id
    click_on "Create List shared"

    assert_text "List shared was successfully created"
    click_on "Back"
  end

  test "should update List shared" do
    visit user_backoffice_list_shared_url(@user_backoffice_list_shared)
    click_on "Edit this list shared", match: :first

    fill_in "Task", with: @user_backoffice_list_shared.task_id
    fill_in "User", with: @user_backoffice_list_shared.user_id
    click_on "Update List shared"

    assert_text "List shared was successfully updated"
    click_on "Back"
  end

  test "should destroy List shared" do
    visit user_backoffice_list_shared_url(@user_backoffice_list_shared)
    click_on "Destroy this list shared", match: :first

    assert_text "List shared was successfully destroyed"
  end
end
