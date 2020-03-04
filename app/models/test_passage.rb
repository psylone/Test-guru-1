class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_find_current_question, on: :create
 
  def current_question_position
    test.questions.index(current_question) + 1
  end

  def questions_count
    test.questions.count
  end
  
  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def success?
    passed_percent >= 85
  end

  def passed_percent
    (correct_questions.to_f * 100 / test.questions.count)
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_find_current_question
    self.current_question = next_question if test.present?
  end

end



