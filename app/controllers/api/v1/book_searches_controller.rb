class Api::V1::BookSearchesController < ApplicationController
  before_action :check_location

  def index
    books = BookFacade.get_books(@location, params[:quantity] )
  end
end

private
  def check_location
    if params[:location].present?
      @location = params[:location]
    else
      render json: JSON.generate({error: 'error'}), status: 400
    end
  end
