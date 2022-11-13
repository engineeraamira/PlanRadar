class Ticket < ApplicationRecord
  belongs_to :user

  enum status_id: { Scheduled: 1, Sent: 2}  #Scheduled: Scheduled to be sent later, Sent: Sent to the user
  validates :user_id,:title,:description, presence: true
  validate :due_date_must_fit_user_setting


  after_initialize do
    self.due_date ||= Time.now
  end

  after_save_commit do
    if due_date_previously_changed? && status_id == "Scheduled" 
      @user = User.find(user_id)
      if @user.send_due_date_reminder   #check if user enabled notification
        @reminder_date = Ticket.get_reminder_date(@user, due_date)
        ReminderJob.set(wait_until: @reminder_date).perform_later(self)
      end
    end
  end

  def reminded?
    (status_id == 'Sent')
  end

  def remind_user!
    @user = User.find_by_id(user_id)
    if(@user.notification_method == "email")
      @response = EmailService.new(email: @user.email, name: @user.name , title: title, description: description).call
      @res = ActiveSupport::JSON.decode(@response) 
      #puts @res["status_code"]
      if(@res["status_code"] == '202')
        update(status_id: 'Sent')
      end
    end
  end


  #calculate the reminder date with utc timezone
  #as the given time is the users time zone
  #check if the user has set the reminder to befor the actual date
  def self.get_reminder_date(user, due_date)
    @user = user
    @reminder_date = (@user.due_date_reminder_interval == 0)? due_date : (due_date - @user.due_date_reminder_interval)
    @reminder_date = @reminder_date.to_s + ' ' + @user.due_date_reminder_time.to_fs(:time)
    @reminder_date = @reminder_date.in_time_zone(@user.time_zone).utc
    return @reminder_date
  end


  private

  def due_date_must_fit_user_setting
    @user = User.where(id: user_id).first
      return errors.add(:due_date, 'User can not be empty') if @user.nil?
      return if @user.send_due_date_reminder == false              #check if user enabled notification

      @reminder_date = Ticket.get_reminder_date(@user, due_date)
      errors.add(:due_date, 'User notifications has gone for this date') if @reminder_date < Time.now
  
  end






end
