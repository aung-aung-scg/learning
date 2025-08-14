# == Schema Information
#
# Table name: activity_logs
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  activity_type :string
#  material_id   :bigint
#  metadata      :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ActivityLog < ApplicationRecord
  belongs_to :user
  belongs_to :material, class_name: "LearningMaterial", optional: true
end
