class ApplicationController < ActionController::Base
  include SessionsHelper
  include TitlesHelper
  
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to '/'
    end
  end
  

  
end
