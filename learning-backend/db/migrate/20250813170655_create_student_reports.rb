class CreateStudentReports < ActiveRecord::Migration[7.1]
  def change
    create_table :student_reports do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :generated_by, null: false, foreign_key: { to_table: :users }
      t.string :report_type
      t.date :start_date
      t.date :end_date
      t.json :metrics
      t.text :notes

      t.timestamps
    end
    add_index :student_reports, [:student_id, :created_at], name: "index_student_reports"
  end
end
