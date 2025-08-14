# == Schema Information
#
# Table name: quiz_questions
#
#  id             :bigint           not null, primary key
#  quiz_id        :bigint           not null
#  question_text  :text
#  question_type  :string
#  options        :json
#  correct_answer :string
#  explanation    :text
#  display_order  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class QuizQuestion < ApplicationRecord
end
