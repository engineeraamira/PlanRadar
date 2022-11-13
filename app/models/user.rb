class User < ApplicationRecord
  include Clearance::User

  has_many :tickets

  validates :email, :uniqueness => { :case_sensitive => false, :on => :create }
  validates_presence_of :name
  validates :due_date_reminder_interval, :numericality => { :greater_than_or_equal_to => 0 }


  enum status: { Active: true, Disabled: false}
  enum locked: { Locked: true, Unlocked: false}
  enum notification_method: { 'email': 1, 'sms': 2, 'push_notification': 3}
  

end
