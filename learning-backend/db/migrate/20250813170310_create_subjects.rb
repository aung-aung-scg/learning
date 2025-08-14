class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.integer :display_order

      t.timestamps
    end
    add_index :subjects, [:course_id, :display_order], name: "index_course_order"
  end
end
