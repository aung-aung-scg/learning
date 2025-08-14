class CreateReviewSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :review_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: { to_table: :learning_materials }
      t.datetime :next_review_at
      t.datetime :last_reviewed_at
      t.float :ease_factor, default: 2.5
      t.integer :review_count, default: 0
      t.integer :interval_days, default: 1

      t.timestamps
    end
    add_index :review_schedules, [:user_id, :material_id], name: "index_user_reviews"
  end
end
