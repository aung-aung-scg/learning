# == Schema Information
#
# Table name: learning_materials
#
#  id               :bigint           not null, primary key
#  subject_id       :bigint           not null
#  title            :string
#  content_type     :string
#  duration_minutes :integer
#  is_premium       :boolean          default(FALSE)
#  display_order    :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class LearningMaterial < ApplicationRecord
  belongs_to :subject
  has_many :material_attachments
  has_many :media_libraries, through: :material_attachments
  has_many :quizzes
  has_many :material_progresses
  has_many :review_schedules
  has_many :activity_logs
end
