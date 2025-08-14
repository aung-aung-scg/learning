# == Schema Information
#
# Table name: enrollments
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  course_id    :bigint           not null
#  enrolled_at  :datetime
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
