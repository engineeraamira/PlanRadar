require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { deleted: @user.deleted, due_date_reminder_interval: @user.due_date_reminder_interval, due_date_reminder_time: @user.due_date_reminder_time, failed_attempts: @user.failed_attempts, locked: @user.locked, login_attempts: @user.login_attempts, mail: @user.mail, name: @user.name, notification_method: @user.notification_method, phone: @user.phone, send_due_date_reminder: @user.send_due_date_reminder, status: @user.status, time_zone: @user.time_zone, unlock_token: @user.unlock_token } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { deleted: @user.deleted, due_date_reminder_interval: @user.due_date_reminder_interval, due_date_reminder_time: @user.due_date_reminder_time, failed_attempts: @user.failed_attempts, locked: @user.locked, login_attempts: @user.login_attempts, mail: @user.mail, name: @user.name, notification_method: @user.notification_method, phone: @user.phone, send_due_date_reminder: @user.send_due_date_reminder, status: @user.status, time_zone: @user.time_zone, unlock_token: @user.unlock_token } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
