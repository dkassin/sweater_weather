require 'rails_helper'
RSpec.describe 'book search API' do
  it 'returns a book search', :vcr do

    get "/api/v1/book-search?location=denver,co&quantity=5"


    book_search = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(book_search).to be_a Hash
  end
end
