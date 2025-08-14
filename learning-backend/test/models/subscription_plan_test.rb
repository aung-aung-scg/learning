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
require "test_helper"

class SubscriptionPlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
