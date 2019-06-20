class ItemsController < ApplicationController
  before_action :require_user_logged_in
  def new
    @title = Title.find(params[:title_id])
    @item = @title.items.build
  end

  def create
    @title = Title.find(params[:item][:title_id])
    @item = @title.items.build(item_params)

    if @item.save
      flash[:success] = 'アイテムを作成しました'
      redirect_to title_path(@title)
    else
      flash.now[:danger] = 'アイテムの作成に失敗しました'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @title = Title.find(params[:title_id])
  end

  def update
    @title = Title.find(params[:item][:title_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = 'アイテム内容を変更しました'
      redirect_to title_path(@title)
    else
      flash.now[:danger] = 'アイテム内容の変更に失敗しました'
      render :edit
    end
  end

  def destroy
    @title = Title.find(params[:title_id])
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = 'アイテムを削除しました。'
    redirect_to title_path(@title)
  end

  private

  def item_params
    params.require(:item).permit(:day, :place, :name, :price, :tag_1, :tag_2, :title_id)
  end


end
