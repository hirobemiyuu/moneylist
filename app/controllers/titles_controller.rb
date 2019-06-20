class TitlesController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :destroy]
  before_action :title_share, only: [:edit, :destroy]
  def index
    if logged_in?
      @titles = Title.order(id: :desc).page(params[:page]).search(params[:search])
      @title = Title.new
    end
  end
  def show
    @title = Title.find(params[:id])
    @items = @title.items.order(id: :desc).page(params[:page]).search_item(params[:search])
    counts(@title)
  end

  def new
    if logged_in?
      @title = current_user.titles.build
    end
  end

  def create
    @title = current_user.titles.build(title_params)
    if params[:title][:status] == "共有"
      @title.status = true
    elsif params[:title][:status] == "個人用"
      @title.status = false
    end
    
    if @title.save
      flash[:success] = '小遣い帳を作成しました'
      redirect_to title_path(@title)
    else
      flash.now[:danger] = '小遣い帳の作成に失敗しました'
      render :new
    end
  end

  def edit
    @title = Title.find(params[:id])
  end

  def update
    @title = Title.find(params[:id])
    if @title.update(title_params)
      flash[:success] = 'タイトルを変更しました'
      redirect_to title_path(@title)
    else
      flash.now[:danger] = 'タイトルの変更に失敗しました'
      render :edit
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    flash[:success] = '小遣い帳を削除しました。'
    redirect_to '/'
  end
  
  private
  
  def title_params
    params.require(:title).permit(:name)
  end
  
  def title_share
    @title = Title.find_by(status: true)
    unless @title
      redirect_to title_path(Title.find(params[:id]))
    end
  end
  
  def counts(title)
    @count_items = title.items.count
  end

end
