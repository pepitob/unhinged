class BookingsController < ApplicationController
  before_action :set_place, only: %i[new create edit update]
  def index
    @bookings = Booking.all
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.place = @place
    @nights = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @nights * price
    if @booking.update(booking_params)
      redirect_to booking_path
    else
      render :new
    end
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :number_of_people, :total_price)
end

def set_place
  @place = Place.find(params[:place_id])
end
