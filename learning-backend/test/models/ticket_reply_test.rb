# == Schema Information
#
# Table name: ticket_replies
#
#  id         :bigint           not null, primary key
#  ticket_id  :bigint           not null
#  author_id  :bigint           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TicketReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
