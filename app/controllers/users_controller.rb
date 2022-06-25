class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @personreviews = Review.where(user_id: @user.id)
  end

  def my_page
    @user = current_user
    @reviews = Review.where(user_id: @user.id)
    @favorites = Favorite.where(user_id: @user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_path(@user)
  end

  def withdraw
  end

  def followeds
    user = User.find(params[:id])
    @users = user.followeds
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :introduction, :image, :is_active)
  end
end
