class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save #保存が成功したら・・・
      log_in @user
      flash[:success] = "ようこそ！キャンプ場を紹介しましょう"
      redirect_to @user
    else
      render "new"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end