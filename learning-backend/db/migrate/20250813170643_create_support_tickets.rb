class CreateSupportTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :support_tickets do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :admin, foreign_key: { to_table: :users }
      t.string :subject
      t.text :message
      t.string :status, default: 'open'
      t.integer :priority, default: 3

      t.timestamps
    end
    add_index :support_tickets, [:student_id, :status], name: "index_student_tickets"
  end
end
