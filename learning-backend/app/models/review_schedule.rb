# == Schema Information
#
# Table name: review_schedules
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  material_id      :bigint           not null
#  next_review_at   :datetime
#  last_reviewed_at :datetime
#  ease_factor      :float            default(2.5)
#  review_count     :integer          default(0)
#  interval_days    :integer          default(1)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ReviewSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :material, class_name: "LearningMaterial"
end
