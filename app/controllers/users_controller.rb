class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    @users = User.order(name: :asc)
  end

  def show
    @user = User.find(params[:id])
    @titles = @user.titles.order(id: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to '/'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザ情報を変更しました'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'ユーザ情報の変更に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザを削除しました。'
    redirect_to '/'
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
end
