json.extract! ticket, :id, :user_id, :title, :description, :due_date, :status_id, :progress, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
