class ToppagesController < ApplicationController
  def index
    if logged_in?
      @titles = Title.order(id: :desc).page(params[:page])
      @title = Title.new
    end
  end
end
