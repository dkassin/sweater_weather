class BookSerializer
  def self.book_serializer(books, forecast, location, quantity)
      {
    "data": {
      "id": "null",
      "type": "books",
      "attributes": {
        "destination": location,
        "forecast": {
          "summary": forecast[:current][:weather][0][:description],
          "temperature": forecast[:current][:temp]
        },
        "total_books_found": books[:numFound],
        "books": books[:docs].shift(quantity.to_i).map do |book|
          {
            "isbn": book[:isbn],
            "title": book[:title],
            "publisher": book[:publisher]
          }
        end
        }
      }
    }
  end
end
