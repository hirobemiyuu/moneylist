class ComentsController < ApplicationController
  def create
    @title = Title.find(params[:coment][:title_id])
    @coment = @title.coments.build(coment_params)
    @coment.user_name = current_user.name
    @coment.userid = current_user.id
    if @coment.save
      flash[:success] = 'コメントを投稿しました'
      redirect_to title_path(@title)
    else
      flash[:danger] = 'コメントの投稿に失敗しました'
      render title_path(@title)
    end
  end

  def destroy
    @title = Title.find(params[:title_id])
    @coment = Coment.find(params[:id])
    @coment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def coment_params
    params.require(:coment).permit(:content, :image)
  end
end
