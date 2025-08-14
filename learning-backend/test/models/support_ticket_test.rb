# == Schema Information
#
# Table name: support_tickets
#
#  id         :bigint           not null, primary key
#  student_id :bigint           not null
#  admin_id   :bigint
#  subject    :string
#  message    :text
#  status     :string           default("open")
#  priority   :integer          default(3)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SupportTicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
