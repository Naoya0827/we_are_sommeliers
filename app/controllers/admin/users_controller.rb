class Admin::UsersController < ApplicationController

  def index
   @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_active, :introduction)
  end
end
