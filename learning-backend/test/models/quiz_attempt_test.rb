# == Schema Information
#
# Table name: quiz_attempts
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  quiz_id        :bigint           not null
#  score          :integer
#  completed_at   :datetime
#  attempt_number :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class QuizAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
