class ToppagesController < ApplicationController
  def index
    if logged_in?
      @titles = Title.order(id: :desc).page(params[:page])
      @title = Title.new
      total_fee(@title)
    end
  end
end
