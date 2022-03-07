
require 'rails_helper'

RSpec.describe 'Book Service' do
  it 'returns a faraday response', :vcr  do
      connection = BookService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns a recipe at random' , :vcr do
      location = "Denver,CO"
      quantity = 5
      get_books = BookService.get_books(location, quantity)
      
      expect(get_books).to be_a Hash
  end
end
