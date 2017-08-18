# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  choice_id  :integer          not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_choice, presence: true
  validate :author_responded_to_own_poll?
  validate :respondent_already_answered?

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not({id: self.id})
  end

  def respondent_already_answered?
    self.sibling_responses.pluck(:user_id).include?(self.user_id)
  end

  def author_responded_to_own_poll?
    self.question.poll.author.id == self.user_id
  end

  def not_dup_response
    if respondent_already_answered?
      errors[:user_id] << 'You already voted!'
    end
  end

end
