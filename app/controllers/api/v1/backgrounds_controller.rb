class Api::V1::BackgroundsController < ApplicationController
  before_action :check_location

  def index
    background = BackgroundFacade.get_image(@location)
    render json: BackgroundSerializer.image_serializer(background, @location)
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
