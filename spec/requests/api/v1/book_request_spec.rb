require 'rails_helper'
RSpec.describe 'book search API' do
  it 'returns a book search', :vcr do

    get "/api/v1/book-search?location=denver,co&quantity=5"


    book_search = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(book_search).to be_a Hash
    expect(book_search[:data]).to have_key(:attributes)
    expect(book_search[:data][:attributes]).to have_key(:destination)
    expect(book_search[:data][:attributes]).to have_key(:forecast)
    expect(book_search[:data][:attributes][:forecast]).to have_key(:summary)
    expect(book_search[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(book_search[:data][:attributes]).to have_key(:total_books_found)
    expect(book_search[:data][:attributes]).to have_key(:books)
    expect(book_search[:data][:attributes][:books].count).to eq(5)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:title)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:publisher)
  end

  it 'returns an error if a location isnt provded ', :vcr do

    get "/api/v1/book-search?location=&quantity=5"


    book_search = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end

  it 'returns a book search even with a negative quantity', :vcr do

    get "/api/v1/book-search?location=denver,co&quantity=-5"


    book_search = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(book_search).to be_a Hash
    expect(book_search[:data]).to have_key(:attributes)
    expect(book_search[:data][:attributes]).to have_key(:destination)
    expect(book_search[:data][:attributes]).to have_key(:forecast)
    expect(book_search[:data][:attributes][:forecast]).to have_key(:summary)
    expect(book_search[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(book_search[:data][:attributes]).to have_key(:total_books_found)
    expect(book_search[:data][:attributes]).to have_key(:books)
    expect(book_search[:data][:attributes][:books].count).to eq(5)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:title)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:publisher)
  end
end
