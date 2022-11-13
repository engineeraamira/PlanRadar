class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 255
      t.string :name, limit: 255
      t.string :phone, limit: 60
      t.integer :notification_method, default: 1
      t.boolean :send_due_date_reminder, default: true
      t.integer :due_date_reminder_interval, default: 0
      t.time :due_date_reminder_time, default: '09:00'
      t.string :time_zone, limit: 60, default: 'Vienna'
      t.boolean :status, default: true
      t.boolean :deleted, default: false
      t.boolean :locked, default: false
      t.string :unlock_token
      t.integer :login_attempts, default: 0
      t.integer :failed_attempts, default: 0

      t.timestamps
    end
  end
end
