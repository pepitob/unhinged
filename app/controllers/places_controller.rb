class PlacesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        places.name @@ :query
        OR places.description @@ :query
        OR places.location @@ :query
        OR places.category @@ :query
      SQL
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.all
    end
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

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(list_params)
      redirect_to places_path
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def list_params
    params.require(:place).permit(:name, :category, :description, :capacity, :location, :price, photos: [])
  end
end
