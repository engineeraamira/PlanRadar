require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      email: "email@gmail.com",
      password: "123456",
      name: "MyString",
      phone: "MyString",
      notification_method: "email",
      send_due_date_reminder: false,
      due_date_reminder_interval: 1,
      due_date_reminder_time: "2000-01-01 09:00",
      time_zone: "Cairo",
      status: false,
      deleted: false,
      locked: false,
      unlock_token: "MyString",
      login_attempts: 1,
      failed_attempts: 1
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "select[name=?]", "user[notification_method]"

      assert_select "input[name=?]", "user[send_due_date_reminder]"

      assert_select "input[name=?]", "user[due_date_reminder_interval]"

      assert_select "input[name=?]", "user[due_date_reminder_time]"

      assert_select "select[name=?]", "user[time_zone]"
    end
  end
end
