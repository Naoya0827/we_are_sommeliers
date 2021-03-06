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
    @genres = Genre.all
    @drinks = params[:name].present? ? Genre.find(params[:name]).drinks : Drink.all
  end

  def search
    if params[:name].present?
      @search_drinks = Drink.where('name LIKE ?', "%#{params[:name]}%")
    else
      @search_drinks = Drink.none
    end
  end

  def show
    @drink = Drink.find(params[:id])
    @review = Review.new
    @favorite_drink = FavoriteDrink.new
    @user = current_user
    @reviews = Review.where(drink_id: @drink.id)
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
