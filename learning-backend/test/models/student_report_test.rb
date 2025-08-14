# == Schema Information
#
# Table name: student_reports
#
#  id              :bigint           not null, primary key
#  student_id      :bigint           not null
#  generated_by_id :bigint           not null
#  report_type     :string
#  start_date      :date
#  end_date        :date
#  metrics         :json
#  notes           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class StudentReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
