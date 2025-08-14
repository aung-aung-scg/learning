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
require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
