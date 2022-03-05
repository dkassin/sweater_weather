
require 'rails_helper'

RSpec.describe 'Location Service' do
  it 'returns a faraday response' do
      connection = LocationService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns a recipe at random' do
      location = "Denver,CO"
      get_location = LocationService.get_location(location)

      expect(get_location).to be_a Hash
      expect(get_location[:results]).to be_a Array
      expect(get_location[:results][0][:locations][0][:latLng]).to be_a Hash
      expect(get_location[:results][0][:locations][0][:latLng]).to have_key :lat
      expect(get_location[:results][0][:locations][0][:latLng]).to have_key :lng
  end
end
