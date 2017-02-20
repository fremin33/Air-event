class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @booking = Booking.new
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:address, :price, :place, :category, :date, :description)
  end
end
