
require 'rails_helper'

RSpec.describe 'Location Service' do
  it 'returns a faraday response for location' , :vcr do
      connection = LocationService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns location data', :vcr do
      location = "Denver,CO"
      get_location = LocationService.get_location(location)

      expect(get_location).to be_a Hash
      expect(get_location[:results]).to be_a Array
      expect(get_location[:results][0][:locations][0][:latLng]).to be_a Hash
      expect(get_location[:results][0][:locations][0][:latLng]).to have_key :lat
      expect(get_location[:results][0][:locations][0][:latLng]).to have_key :lng
  end

  it 'returns a faraday response for direction' , :vcr do
      connection = LocationService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns directions', :vcr do
      origin = "Denver,CO"
      destination = "Pueblo,CO"
      get_directions = LocationService.get_directions(origin, destination)

      expect(get_directions).to be_a Hash

      expect(get_directions[:route]).to be_a Hash
      expect(get_directions[:route]).to have_key :formattedTime
      expect(get_directions[:route]).to have_key :boundingBox
      # ul is the starting point and lr is the ending point
      expect(get_directions[:route][:boundingBox]).to have_key :lr
      expect(get_directions[:route][:boundingBox]).to have_key :ul
      expect(get_directions[:route][:boundingBox][:lr]).to have_key :lng
      expect(get_directions[:route][:boundingBox][:lr]).to have_key :lat
      expect(get_directions[:route][:boundingBox][:ul]).to have_key :lng
      expect(get_directions[:route][:boundingBox][:ul]).to have_key :lat
      expect(get_directions[:info]).to have_key :messages
  end

  it 'returns an error if travel impossible', :vcr do
      origin = "Denver,CO"
      destination = "London, UK"
      get_directions = LocationService.get_directions(origin, destination)

      expect(get_directions).to be_a Hash

      expect(get_directions[:route]).to be_a Hash
      expect(get_directions[:info]).to be_a Hash
      expect(get_directions[:info]).to have_key :messages
  end
end
