class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found



  private

  def rescue_with_not_found
    render plain: 'Not found, try again'

  end


end
