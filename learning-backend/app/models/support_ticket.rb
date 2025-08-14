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
class SupportTicket < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :admin, class_name: "User", optional: true
  has_many :ticket_replies
end
