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
require "test_helper"

class LearningMaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
