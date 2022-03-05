class Api::V1::ForecastController < ApplicationController
  before_action :check_location
  def index
    forecast = ForecastFacade.get_forecast(@coordinates.lat, @coordinates.lng)
    render json: ::ForecastSerializer.forecast_serializer(forecast)
  end
end

private
  def check_location
    if params[:location].present?
      @coordinates = LocationFacade.get_location(params[:location])
    else
      render json: JSON.generate({error: 'error'}), status: 400
    end
  end
