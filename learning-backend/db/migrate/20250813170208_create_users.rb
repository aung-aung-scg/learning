# db/migrate/20250813100000_create_users.rb
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest
      t.string :role, default: 'student'
      t.datetime :last_active_at

      t.timestamps
    end
  end
end
