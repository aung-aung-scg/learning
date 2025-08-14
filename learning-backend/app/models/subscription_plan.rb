# == Schema Information
#
# Table name: subscription_plans
#
#  id            :bigint           not null, primary key
#  name          :string
#  price         :decimal(10, 2)
#  duration_days :integer
#  features      :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class SubscriptionPlan < ApplicationRecord
  has_many :subscriptions, foreign_key: :plan_id
  has_many :users, through: :subscriptions
end
