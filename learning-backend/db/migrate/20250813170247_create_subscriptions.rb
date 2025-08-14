class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: { to_table: :subscription_plans }
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :status
      t.string :stripe_subscription_id

      t.timestamps
    end
    add_index :subscriptions, [:user_id, :plan_id], name: "index_user_subscription"
  end
end
