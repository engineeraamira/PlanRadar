json.extract! user, :id, :mail, :name, :phone, :notification_method, :send_due_date_reminder, :due_date_reminder_interval, :due_date_reminder_time, :time_zone, :status, :deleted, :locked, :unlock_token, :login_attempts, :failed_attempts, :created_at, :updated_at
json.url user_url(user, format: :json)
