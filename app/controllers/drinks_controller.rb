class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    @drink.save
    redirect_to drink_path(@drink.id)
  end

  def index
  end

  def show
    @drink = Drink.find(params[:id])
    @review = Review.new
    @user = current_user
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    @drink.update(drink_params)
    redirect_to drink_path(@drink.id)
  end

  private
  def drink_params
    params.require(:drink).permit(:genre_id, :creator_id, :name, :alcohol, :introduction)
  end
end
