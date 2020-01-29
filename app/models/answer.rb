class Answer < ApplicationRecord
  belongs_to :question

  validates :question, :body, presence: true
  validate :validate_amount_of_answers, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_amount_of_answers
    errors.add(:base) if question.answers.size >= 4
  end

end
