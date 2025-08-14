class CreateLearningMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :learning_materials do |t|
      t.references :subject, null: false, foreign_key: true
      t.string :title
      t.string :content_type
      t.integer :duration_minutes
      t.boolean :is_premium, default: false
      t.integer :display_order

      t.timestamps
    end
    add_index :learning_materials, [:subject_id, :display_order], name: "index_subject_order"
  end
end
