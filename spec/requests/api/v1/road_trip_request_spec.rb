require 'rails_helper'
RSpec.describe 'road trip API' do
  it 'returns a road trip', :vcr do

    data =
    {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(data)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(road_trip).to be_a Hash
    
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data]).to have_key(:attributes)
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes][:start_city]).to be_a String
    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes][:end_city]).to be_a String
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes][:travel_time]).to be_a String
    expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end
end
