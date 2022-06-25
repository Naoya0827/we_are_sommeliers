class FavoriteDrinksController < ApplicationController
  def create
    @favorite_drink = FavoriteDrink.new(favorite_drink_params)
    @favorite_drink.save
    redirect_to request.referer
  end

  def destroy
    @favorite_drink = FavoriteDrink.find_by(user_id: current_user.id, drink_id: params[:id])
    @favorite_drink.destroy
    redirect_to request.referer
  end

  def index
    @user = current_user
    @favorite_drinks = FavoriteDrink.where(user_id: @user.id)
  end

  private
  def favorite_drink_params
    params.require(:favorite_drink).permit(:user_id, :drink_id)
  end
end
