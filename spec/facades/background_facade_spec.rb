require 'rails_helper'

RSpec.describe BackgroundFacade, type: :facade do
  context 'class methods' do
    describe '::get_image' do
      it 'should return a hash of the image' , :vcr do
          location = "Denver,CO"
          image = BackgroundFacade.get_image(location)

          expect(image).to be_a Hash
      end
    end
  end
end
