class TestsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

def index
  tests = Test.all
  titles = []
  tests.each { |test| titles.push(test.title)}
  render plain: titles.join("\n")
end

def show
  render plain: Test.find(params[:id]).title
end


private

def rescue_with_not_found
  render plain: 'Not found, try again'
end

end
