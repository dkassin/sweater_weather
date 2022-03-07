
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
      expect(get_books).to have_key :numFound
      expect(get_books[:docs]).to be_a Array
      get_books[:docs].shift(quantity).each do |book|
        expect(book).to have_key(:isbn)
        expect(book).to have_key(:title)
        expect(book).to have_key(:publisher)
      end
  end
end
