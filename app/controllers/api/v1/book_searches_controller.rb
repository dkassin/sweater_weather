class Api::V1::BookSearchesController < ApplicationController
  before_action :check_location

  def index

    forecast = ForecastFacade.get_forecast(@coordinates.lat, @coordinates.lng)
    books = BookFacade.get_books(@location)
    render json: BookSerializer.book_serializer(books, forecast, params[:location], params[:quantity])
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
