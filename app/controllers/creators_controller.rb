class CreatorsController < ApplicationController
  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)
    @creator.save
    redirect_to creator_path(@creator.id)
  end

  def show
    @creator = Creator.find(params[:id])
    @drinks = Drink.where(creator_id: @creator.id)
  end

  def edit
     @creator = Creator.find(params[:id])
  end

  def update
     @creator = Creator.find(params[:id])
     @creator.update(creator_params)
     redirect_to creator_path(@creator.id)
  end

  def index


    @areas = Area.all
    @creators = params[:name].present? ? Area.find(params[:name]).creators : Creator.all
  end

  def search
    if params[:name].present?
      @search_creators = Creator.where('name LIKE ?', "%#{params[:name]}%")
    else
      @search_creators = Creator.none
    end
  end

  private
  def creator_params
    params.require(:creator).permit(:name, :url, :area_id, :introduction)
  end
end
