class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new]
  before_action :set_event, only: [ :edit, :update, :destroy]

  def index
    @events = Event.all
    if params[:search]
      if params[:search][:category_id].blank?
        return @events
      end
      if params[:search][:category_id]
        @events = @events.where(category_id: params[:search][:category_id])
      end
      # TODO: params[:search][:address] => Geocoder
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      flash[:alert] = "invalid event"
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to event_url, notice: 'Event was successfully destroyed.'
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :address, :picture, :price, :date, :place, :description,)
  end
end
