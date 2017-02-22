class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def new
    @new_booking = Booking.new
    @event = Event.find(params[:event_id])
  end

  def create
    @new_booking = Booking.new(booking_params)
  end
end
