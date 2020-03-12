class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def new
    @test = Test.new
  end

  def create
    # NOTE: используй метод ассоциации current_user.tests.new(test_params)
    @test = Test.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path(@test)
  end

  private

  def test_params
    # NOTE: не нужно передавать `author_id`, у тебя уже есть объект `current_user`
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
