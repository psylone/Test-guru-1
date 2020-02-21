module QuestionsHelper

  def question_header
    if @question.body.present?
      "Create new question"
    else
      "Edit question '#{@question.body}'"
    end
  end
end
