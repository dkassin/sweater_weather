require 'rails_helper'
RSpec.describe 'session API' do
  it 'returns a session user', :vcr do
    user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")
    data =
    {
      "email": "test@email.com",
      "password": "password"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(data)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user).to be_a Hash

    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end
end
