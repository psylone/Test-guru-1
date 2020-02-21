module TestsHelper
  def test_header
    if @test.title.nil?
      'Create new test'
    else
      "Edit test"
    end
  end

  def create_new_question_link
    link_to 'Create new question', new_test_question_path(@test, @question)
  end

end
