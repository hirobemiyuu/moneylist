class TitlesController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]
  def show
    @title = Title.find(params[:id])
    @items = @title.items.order(day: :desc)
    counts(@title)
    total_fee(@title)
  end

  def new
    if logged_in?
      @title = current_user.titles.build
    end
  end

  def create
    @title = current_user.titles.build(title_params)
    
    if @title.save
      flash[:success] = '小遣い帳を作成しました'
      redirect_to title_path(@title)
    else
      flash.now[:danger] = '小遣い帳の作成に失敗しました'
      render :new
    end
  end

  def edit
    @title = current_user.titles.find(params[:id])
  end

  def update
    @title = current_user.titles.find(params[:id])
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
  
  def correct_user
    @title = current_user.titles.find_by(id: params[:id])
    unless @title
      redirect_to title_path(Title.find(params[:id]))
    end
  end
  
  def counts(title)
    @count_items = title.items.count
  end

end
