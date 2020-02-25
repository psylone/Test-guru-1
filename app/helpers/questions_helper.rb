module QuestionsHelper

  def question_header
    if @question.new_record?
      "Create new question"
    else
      "Edit question '#{@question.body}'"
    end
  end
end
