require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      email: "email@gmail.com",
      name: "Name",
      phone: "Phone",
      password: "123456",
      notification_method: 1,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/email@gmail.com/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/0/)
    expect(rendered).to match(/09:00/)
    expect(rendered).to match(/Cairo/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Unlock Token/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
