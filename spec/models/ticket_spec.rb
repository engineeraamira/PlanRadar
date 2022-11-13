require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let(:user) {
        User.create(
            email: "Email@gmail.com",
            name: "Name",
            phone: "Phone",
            password: "123456",
            notification_method: 1,
            send_due_date_reminder: true,
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
   
    subject {
        described_class.new(user_id: user.id,
                            title: "Anything",
                            description: "Lorem ipsum",
                            created_at: DateTime.now,
                            due_date: DateTime.current.to_date + user.due_date_reminder_interval + 1.day,
                            updated_at: DateTime.now + 1.week,
                          )
      }
    
    it "is valid with valid attributes" do
    expect(subject).to be_valid
    end
    
    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "is not valid due date" do
        subject.due_date = "2022-11-01"
        expect(subject).to_not be_valid
    end  

    describe "get_reminder_date" do
        it "return the time when reminder will be sent to the user" do
            reminded_time = described_class.get_reminder_date(user, "2022-11-15")
            expect(reminded_time).to eq "2022-11-15 23:00".in_time_zone(user.time_zone).utc
        end
    end

    

   
end
