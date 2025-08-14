# == Schema Information
#
# Table name: material_progresses
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  material_id   :bigint           not null
#  status        :string           default("not_started")
#  last_position :integer          default(0)
#  completed_at  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class MaterialProgress < ApplicationRecord
  belongs_to :user
  belongs_to :material, class_name: "LearningMaterial"
end
