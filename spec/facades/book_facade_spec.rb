require 'rails_helper'

RSpec.describe BookFacade, type: :facade do
  context 'class methods' do
    describe '::get_books' do
      it 'should return a hash of the image' , :vcr do
          location = "Denver,CO"
          quantity = 5
          books = BookFacade.get_books(location)

          expect(books).to be_a Hash
      end
    end
  end
end
