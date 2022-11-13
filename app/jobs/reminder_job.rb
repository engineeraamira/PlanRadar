class ReminderJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    puts ticket
    return if ticket.reminded?

    #Rescheduled the ticket to the future
    return if ticket.due_date.in_time_zone(ticket.user.time_zone).utc > Time.current

    ticket.remind_user!
  end
end
