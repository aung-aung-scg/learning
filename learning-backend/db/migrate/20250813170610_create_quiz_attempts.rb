class CreateQuizAttempts < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.integer :score
      t.datetime :completed_at
      t.integer :attempt_number

      t.timestamps
    end
    add_index :quiz_attempts, [:user_id, :quiz_id], name: "index_user_quiz"
  end
end
