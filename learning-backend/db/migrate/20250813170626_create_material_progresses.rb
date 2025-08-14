class CreateMaterialProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :material_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: { to_table: :learning_materials }
      t.string :status, default: 'not_started'
      t.integer :last_position, default: 0
      t.datetime :completed_at

      t.timestamps
    end
    add_index :material_progresses, [:user_id, :material_id], name: "index_user_material"
  end
end
