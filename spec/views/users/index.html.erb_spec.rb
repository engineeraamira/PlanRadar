require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "email@gmail.com",
        name: "Name",
        phone: "Phone",
        password: "123456",
        notification_method: 2,
        send_due_date_reminder: false,
        due_date_reminder_interval: 0,
        due_date_reminder_time: '2000-01-01 09:00',
        time_zone: "Cairo",
        status: false,
        deleted: false,
        locked: false,
        unlock_token: "Unlock Token",
        login_attempts: 4,
        failed_attempts: 5
      ),
      User.create!(
        email: "email2@gmail.com",
        name: "Name",
        phone: "Phone",
        password: "123456",
        notification_method: 2,
        send_due_date_reminder: false,
        due_date_reminder_interval: 0,
        due_date_reminder_time: '2000-01-01 09:00',
        time_zone: "Cairo",
        status: false,
        deleted: false,
        locked: false,
        unlock_token: "Unlock Token",
        login_attempts: 4,
        failed_attempts: 5
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = 'tr>td' #Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("email@gmail.com".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('on due date'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('09:00'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cairo".to_s), count: 2
  end
end
