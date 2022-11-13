class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :user, null: true, foreign_key: true
      t.string :title, limit: 255
      t.text :description, limit: 1000
      t.date :due_date
      t.integer :status_id, default: 1
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
