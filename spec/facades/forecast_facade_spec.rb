require 'rails_helper'

RSpec.describe ForecastFacade, type: :facade do
  context 'class methods' do
    describe '::get_location' do
      it 'should return a location object' , :vcr do
          lat = 39.738453
          lng = -104.984853
          forecast = ForecastFacade.get_forecast(lat, lng)

          expect(forecast).to be_a Hash
      end
    end
  end
end
