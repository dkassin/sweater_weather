class BookFacade
  def self.get_books(location, quantity)
    books = BookService.get_books(location, quantity)
  end
end
