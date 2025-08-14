class CreateMediaLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :media_library do |t|
      t.string :file_name
      t.string :file_type
      t.integer :file_size_mb
      t.string :s3_url
      t.bigint :uploaded_by, null: false
      t.string :approval_status, default: 'pending'

      t.timestamps
    end
    add_foreign_key :media_library, :users, column: :uploaded_by
    add_index :media_library, [:uploaded_by, :approval_status], name: "index_uploader_status"
  end
end
