class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]
  before_action :set_event, only: [:new, :create]

  def index
    @user = current_user
    if !current_user.nil?
      @bookings = Booking.where(user: @user)
      @booking_count = Booking.where(user: @user).count
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @booking = Booking.new(booking_params)
      @booking.event = @event
      @booking.user = current_user
      @booking.save
      redirect_to bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:place)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
