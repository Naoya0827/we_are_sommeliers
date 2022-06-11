class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_path(@user)
  end

  def withdraw
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :introduction, :image, :is_active)
  end
end
