class BookingsController < ApplicationController
  before_action :set_place, only: %i[new create edit update]

  def index
    @bookings = Booking.all
  end

  def new
    if current_user
      @booking = Booking.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.place = @place
    @nights = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @booking.place.price * @nights
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.place = @place
    @booking.user = current_user
    @nights = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @place.price * @nights
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_people, :total_price)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
