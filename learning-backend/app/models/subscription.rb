# == Schema Information
#
# Table name: subscriptions
#
#  id                     :bigint           not null, primary key
#  user_id                :bigint           not null
#  plan_id                :bigint           not null
#  starts_at              :datetime
#  ends_at                :datetime
#  status                 :string
#  stripe_subscription_id :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Subscription < ApplicationRecord
   belongs_to :user
  belongs_to :plan, class_name: "SubscriptionPlan"
end
