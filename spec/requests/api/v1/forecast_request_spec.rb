require 'rails_helper'
RSpec.describe 'Forecast API' do
  it 'returns a forecast' do

    get "/api/v1/forecast?location=denver,co"


    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

  end
end
