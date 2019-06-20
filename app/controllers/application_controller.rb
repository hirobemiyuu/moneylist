class ApplicationController < ActionController::Base
  include SessionsHelper
  include TitlesHelper
  
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def total_fee(title)
    @fee = 0
    title.items.each do |item|
      @fee += item.price
    end
  end
  
end
