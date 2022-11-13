require 'rails_helper'

RSpec.describe "tickets/index", type: :view do

  let(:user) {User.create(
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
                      )}

  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        user: user,
        title: "Title",
        description: "MyText",
        status_id: 2,
        progress: 0,
        due_date: DateTime.current.to_date + user.due_date_reminder_interval + 1.day
      ),
      Ticket.create!(
        user: user,
        title: "Title",
        description: "MyText",
        status_id: 2,
        progress: 0,
        due_date: DateTime.current.to_date + user.due_date_reminder_interval + 1.day
      )
    ])
  end

  it "renders a list of tickets" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, {:text=>Regexp.new("Name".to_s), :count=>2}
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(0.to_s), count: 4
    assert_select cell_selector, text: Regexp.new((DateTime.current.to_date + user.due_date_reminder_interval + 1.day).to_s), count: 2
  end
end
