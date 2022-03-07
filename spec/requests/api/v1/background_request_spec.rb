require 'rails_helper'
RSpec.describe 'Image API' do
  it 'returns an image details' , :vcr do

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get "/api/v1/backgrounds?location=denver,co", headers: headers

    image = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(image).to be_a Hash

    expect(image[:data]).to have_key(:id)
    expect(image[:data]).to have_key(:type)
    expect(image[:data]).to have_key(:attributes)
    expect(image[:data][:attributes]).to have_key(:image)
    expect(image[:data][:attributes][:image]).to have_key(:location)
    expect(image[:data][:attributes][:image]).to have_key(:image_url)
    expect(image[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(image[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(image[:data][:attributes][:image][:credit]).to have_key(:logo)
  end
end
