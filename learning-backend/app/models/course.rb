# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  title         :string
#  description   :text
#  level         :string
#  is_premium    :boolean          default(FALSE)
#  thumbnail_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  has_many :subjects
  has_many :enrollments
  has_many :users, through: :enrollments
end
