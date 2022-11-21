class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    if current_user
      @place = Place.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @place = Place.new(list_params)
    @place.user = current_user
    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def list_params
    params.require(:place).permit(:name, :category, :description, :capacity, :location, :price)
  end
end
