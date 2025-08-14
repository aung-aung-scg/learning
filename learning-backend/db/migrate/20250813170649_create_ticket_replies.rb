class CreateTicketReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_replies do |t|
      t.references :ticket, null: false, foreign_key: { to_table: :support_tickets }
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :content

      t.timestamps
    end
    add_index :ticket_replies, [:ticket_id, :author_id], name: "index_ticket_thread"
  end
end
