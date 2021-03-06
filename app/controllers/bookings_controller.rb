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
    @event = Event.find(params[:event_id])
    @event_coordinates = { lat: @event.latitude, lng: @event.longitude }
    @hash = Gmaps4rails.build_markers([@event]) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
    session[:url] = request.original_url
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
      flash[:notice] = "Booking saved in your account!"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking.event)
    flash[:notice] = "Booking canceled!"

  end

  private

  def booking_params
    params.require(:booking).permit(:place)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
