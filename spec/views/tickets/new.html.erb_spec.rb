require 'rails_helper'

RSpec.describe "tickets/new", type: :view do

  let(:user) {
    User.create(
      email: "Email@gmail.com",
      name: "Name",
      phone: "Phone",
      password: "123456",
      notification_method: 1,
      send_due_date_reminder: false,
      due_date_reminder_interval: 0,
      due_date_reminder_time: '2000-01-01 23:00',
      time_zone: "Cairo",
      status: false,
      deleted: false,
      locked: false,
      unlock_token: "Unlock Token",
      login_attempts: 4,
      failed_attempts: 5
    )
  }

  before(:each) do
    assign(:ticket, Ticket.new(
      user_id: user,
      title: "MyString",
      description: "MyText",
      status_id: 1,
      progress: 1,
      due_date: Time.now
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "select[name=?]", "ticket[user_id]"
      assert_select "input[name=?]", "ticket[title]"
      assert_select "textarea[name=?]", "ticket[description]"
      assert_select "input[name=?]", "ticket[due_date]"

    end
  end
end
