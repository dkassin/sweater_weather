class Api::V1::RoadTripsController < ApplicationController
  # before_action :check_location
  def index
  end
end

# private
#   def check_location
#     if params[:location].present?
#       @coordinates = LocationFacade.get_location(params[:location])
#     else
#       render json: JSON.generate({error: 'error'}), status: 400
#     end
#   end
