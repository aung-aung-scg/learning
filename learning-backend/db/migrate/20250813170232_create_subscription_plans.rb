class CreateSubscriptionPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.integer :duration_days
      t.json :features

      t.timestamps
    end
  end
end
