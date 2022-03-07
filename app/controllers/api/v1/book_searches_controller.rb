class Api::V1::BookSearchesController < ApplicationController
  before_action :check_location

  def index
    quantity = (params[:quantity].to_i).abs
    forecast = ForecastFacade.get_forecast(@coordinates.lat, @coordinates.lng)
    books = BookFacade.get_books(params[:location])
    render json: BookSerializer.book_serializer(books, forecast, params[:location], quantity)
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
