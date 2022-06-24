class Admin::UsersController < ApplicationController

  def index
   @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
  end

  def delete
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
end
