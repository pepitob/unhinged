class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(list_params)
    if @place.save
      redirect_to places_path, notice: "The listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:place).permit(:name, :category, :description, :capacity, :location, :price)
  end
end
