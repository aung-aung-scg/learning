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
class TicketReply < ApplicationRecord
  belongs_to :ticket, class_name: "SupportTicket"
  belongs_to :author, class_name: "User"
end
