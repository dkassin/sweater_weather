class Api::V1::RoadTripsController < ApplicationController
  before_action :check_location
  before_action :check_api_key

  def index
    directions = LocationFacade.get_directions(params[:origin], params[:destination])
    if directions.message == []
      forecast = ForecastFacade.get_forecast(@coordinates.lat, @coordinates.lng)
      forecast_index = directions.rounded_hours - 1

      if forecast_index < 0
        forecast_current = forecast[:current]
        render json: RoadTripSerializer.road_trip_serializer(directions, forecast_current, params[:origin], params[:destination])
      elsif forecast_index <= 49
        forecast_hour = forecast[:hourly][(directions.rounded_hours - 1)]
        render json: RoadTripSerializer.road_trip_serializer(directions, forecast_hour, params[:origin], params[:destination])
      else
        forecast_index > forecast[:daily][2]
        render json: RoadTripSerializer.road_trip_serializer(forecast_daily, forecast_hour, params[:origin], params[:destination])
      end
    else
      render json: RoadTripSerializer.invalid_trip(params[:origin], params[:destination])
    end
  end
end

private
  def check_location
    if params[:origin].present? && params[:destination].present?
      @coordinates = LocationFacade.get_location(params[:destination])
    else
      render json: JSON.generate({error: 'error'}), status: 400
    end
  end

  def check_api_key
    user = User.find_by(auth_token: params[:api_key])
    if user.nil?
      render json: JSON.generate({error: 'no API key is given, or an incorrect key is provided'}), status: 401
    end
  end

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end
