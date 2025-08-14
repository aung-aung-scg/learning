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
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
