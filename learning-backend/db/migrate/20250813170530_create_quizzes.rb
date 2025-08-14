class CreateQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :quizzes do |t|
      t.references :material, null: false, foreign_key: { to_table: :learning_materials }
      t.string :title
      t.integer :passing_score, default: 70
      t.integer :max_attempts, default: 3

      t.timestamps
    end
  end
end
