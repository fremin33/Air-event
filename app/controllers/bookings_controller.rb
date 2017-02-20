class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def edit
    @booking = Booking.find(params[:user_id])
  end

  def update
      @booking.update(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:place, :review, :rating)
  end
end
