class CreateMaterialAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :material_attachments do |t|
      t.references :material, null: false, foreign_key: { to_table: :learning_materials }
      t.references :media, null: false, foreign_key: { to_table: :media_library }
      t.string :attachment_type

      t.timestamps
    end
    add_index :material_attachments, [:material_id, :media_id], name: "index_material_media"
  end
end
