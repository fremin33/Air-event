class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
    @localisation = Localisation.new
  end

  def create
    @categories = Category.all
    @event = Event.new(event_params)
    if @event.save
      @localisation = Localisation.new(localisation_params)
      @localisation.save
      @event.localisation = @localisation
      @event.save
      redirect_to @event
    else
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

  def localisation_params
    params.require(:localisation).permit(:address, :zip_code, :city, :country)
  end

  def event_params
    params.require(:event).permit(:name, :price, :date, :place, :description, :picture, :category_id)
  end
end
