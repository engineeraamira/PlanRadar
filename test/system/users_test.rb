require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    check "Deleted" if @user.deleted
    fill_in "Due date reminder interval", with: @user.due_date_reminder_interval
    fill_in "Due date reminder time", with: @user.due_date_reminder_time
    fill_in "Failed attempts", with: @user.failed_attempts
    check "Locked" if @user.locked
    fill_in "Login attempts", with: @user.login_attempts
    fill_in "Mail", with: @user.mail
    fill_in "Name", with: @user.name
    fill_in "Notification method", with: @user.notification_method
    fill_in "Phone", with: @user.phone
    check "Send due date reminder" if @user.send_due_date_reminder
    check "Status" if @user.status
    fill_in "Time zone", with: @user.time_zone
    fill_in "Unlock token", with: @user.unlock_token
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    check "Deleted" if @user.deleted
    fill_in "Due date reminder interval", with: @user.due_date_reminder_interval
    fill_in "Due date reminder time", with: @user.due_date_reminder_time
    fill_in "Failed attempts", with: @user.failed_attempts
    check "Locked" if @user.locked
    fill_in "Login attempts", with: @user.login_attempts
    fill_in "Mail", with: @user.mail
    fill_in "Name", with: @user.name
    fill_in "Notification method", with: @user.notification_method
    fill_in "Phone", with: @user.phone
    check "Send due date reminder" if @user.send_due_date_reminder
    check "Status" if @user.status
    fill_in "Time zone", with: @user.time_zone
    fill_in "Unlock token", with: @user.unlock_token
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
