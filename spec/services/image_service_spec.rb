
require 'rails_helper'

RSpec.describe 'Image Service' do
  it 'returns a faraday response' , :vcr do
      connection = ImageService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns a recipe at random', :vcr do
      location = "Denver,CO"
      get_image = ImageService.get_image(location)

      expect(get_image).to be_a Hash
      expect(get_image[:photos]).to be_a Array
      expect(get_image[:photos][0]).to be_a Hash
      expect(get_image[:photos][0]).to have_key :url
      expect(get_image[:photos][0]).to have_key :photographer_url
      expect(get_image[:photos][0]).to have_key :photographer
      expect(get_image[:photos][0][:src]).to have_key :original
  end
end
