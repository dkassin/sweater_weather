require 'rails_helper'
RSpec.describe 'road trip API' do
  it 'returns a road trip', :vcr do

    data =
    {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    road_trip = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(data)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(road_trip).to be_a Hash

  end
end
