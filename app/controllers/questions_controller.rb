class QuestionsController < ApplicationController

  before_action :find_test, :find_question

  def index
    questions = @test.questions
    bodies = []
    questions.each { |question| bodies.push(question.body) }
    render plain: bodies.join("\n")

  end

  def show
    question_body = @test.questions.find(params[:id]).body
    render plain: question_body
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create!(question_params)
    if @question.save
      redirect_to url_for(@test)
    else
      render :new
    end
  end

 def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to url_for(@test)
    else
      render :edit
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to url_for(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
