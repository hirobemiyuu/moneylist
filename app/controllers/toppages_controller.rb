class ToppagesController < ApplicationController
  def index
    if logged_in?
      @titles = Title.order(id: :desc).page(params[:page])
    end
  end
end
