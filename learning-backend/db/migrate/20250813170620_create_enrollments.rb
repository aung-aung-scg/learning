class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.datetime :enrolled_at
      t.datetime :completed_at

      t.timestamps
    end
    add_index :enrollments, [:user_id, :course_id], name: "index_user_course"
  end
end
