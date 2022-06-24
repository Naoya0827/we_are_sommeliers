class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    redirect_to request.referer
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, review_id: params[:id], drink_id: params[:id.drink.id])
    @favorite.destroy
    redirect_to request.referer
  end

  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :drink_id, :review_id)
  end

end
