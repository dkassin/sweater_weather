class BookFacade
  def self.get_books(location)
    books = BookService.get_books(location)
  end
end
