class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を編集しました。"
    else
      render 'edit'
    end
  end

  def like_feeds
    @user = User.find(params[:id])
    @favorites = current_user.favorite_feeds.all

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password,
                                 :password_confirmation, :profile)
  end
end
