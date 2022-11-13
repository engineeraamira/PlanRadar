require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
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
    assign(:ticket, Ticket.create!(
      user_id: user.id,
      title: "Title",
      description: "MyText",
      status_id: 2,
      progress: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
