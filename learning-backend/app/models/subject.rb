# == Schema Information
#
# Table name: subjects
#
#  id            :bigint           not null, primary key
#  course_id     :bigint           not null
#  title         :string
#  display_order :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Subject < ApplicationRecord
  belongs_to :course
  has_many :learning_materials
end
