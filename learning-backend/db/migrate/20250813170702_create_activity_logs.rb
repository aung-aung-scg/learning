class CreateActivityLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :activity_type
      t.references :material, foreign_key: { to_table: :learning_materials }
      t.json :metadata

      t.timestamps
    end
    add_index :activity_logs, [:user_id, :activity_type], name: "index_user_activity"
  end
end
