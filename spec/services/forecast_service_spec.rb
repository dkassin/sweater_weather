
require 'rails_helper'

RSpec.describe 'Forecast Service' do
  it 'returns a faraday response' , :vcr do
      connection = ForecastService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns a recipe at random', :vcr do
      lat = 39.738453
      lng = -104.984853
      get_forecast = ForecastService.get_forecast(lat, lng)
      expect(get_forecast).to be_a Hash
      expect(get_forecast).to have_key(:current)
      expect(get_forecast[:current]).to have_key(:dt)
      expect(get_forecast[:current]).to have_key(:sunrise)
      expect(get_forecast[:current]).to have_key(:sunset)
      expect(get_forecast[:current]).to have_key(:temp)
      expect(get_forecast[:current]).to have_key(:feels_like)
      expect(get_forecast[:current]).to have_key(:humidity)
      expect(get_forecast[:current]).to have_key(:uvi)
      expect(get_forecast[:current]).to have_key(:visibility)
      expect(get_forecast[:current][:weather][0]).to have_key(:description)
      expect(get_forecast[:current][:weather][0]).to have_key(:icon)
      get_forecast[:daily].shift(5).each do |day|
        expect(day).to have_key(:dt)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day[:temp]).to have_key(:max)
        expect(day[:temp]).to have_key(:min)
        expect(day[:weather][0]).to have_key(:description)
        expect(day[:weather][0]).to have_key(:icon)
      end
      get_forecast[:hourly].shift(8).each do |hour|
        expect(hour).to have_key(:dt)
        expect(hour).to have_key(:temp)
        expect(hour[:weather][0]).to have_key(:description)
        expect(hour[:weather][0]).to have_key(:icon)
      end
  end
end
