# == Schema Information
#
# Table name: quizzes
#
#  id            :bigint           not null, primary key
#  material_id   :bigint           not null
#  title         :string
#  passing_score :integer          default(70)
#  max_attempts  :integer          default(3)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
