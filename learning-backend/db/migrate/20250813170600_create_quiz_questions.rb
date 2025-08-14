class CreateQuizQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.text :question_text
      t.string :question_type
      t.json :options
      t.string :correct_answer
      t.text :explanation
      t.integer :display_order

      t.timestamps
    end
    add_index :quiz_questions, [:quiz_id, :display_order], name: "index_quiz_order"
  end
end
