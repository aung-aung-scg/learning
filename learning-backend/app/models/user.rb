# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string           not null
#  password_digest :string
#  role            :string           default("student")
#  last_active_at  :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
   has_secure_password

  # Subscriptions
  has_many :subscriptions
  has_many :subscription_plans, through: :subscriptions

  # Enrollments & Progress
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :material_progresses
  has_many :review_schedules

  # Quizzes
  has_many :quiz_attempts

  # Support & Reports
  has_many :support_tickets, foreign_key: :student_id
  has_many :assigned_tickets, class_name: "SupportTicket", foreign_key: :admin_id
  has_many :ticket_replies, foreign_key: :author_id
  has_many :student_reports, foreign_key: :student_id
  has_many :generated_reports, class_name: "StudentReport", foreign_key: :generated_by

  # Activity
  has_many :activity_logs
end
