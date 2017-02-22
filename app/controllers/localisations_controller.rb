class LocalisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new, :create]
  def index
    @localisations = Localisation.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@localisations) do |localisation, marker|
      marker.lat localisation.latitude
      marker.lng localisation.longitude
      # marker.infowindow render_to_string(partial: "/localisations/map_box", locals: { localisation: localisation })
    end
  end

  def new
    @localisation = Localisation.new
  end

  def create
    @localisation = Localisation.new(localisation_params)
    if @localisation.save
      redirect_to root_path, notice: 'Your localisation has been created'
    else
      render :new
    end
  end

  private
  def localisation_params
    params.require(:localisation).permit(:address, :zip_code, :city, :country)
  end
end
