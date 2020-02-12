class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    questions = @test.questions
    bodies = []
    questions.each { |question| bodies.push(question.body) }
    render plain: bodies.join("\n")

  end

  def show
    render plain: question_body = @test.questions.find(params[:id]).body
  end

  def new
  end

  def create
    question = @test.questions.create!(question_params)
  end

  def destroy
    Question.find(params[:id]).destroy!
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_not_found
    render plain: 'Not found, try again'
  end
end
