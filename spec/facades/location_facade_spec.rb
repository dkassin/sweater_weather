require 'rails_helper'

RSpec.describe LocationFacade, type: :facade do
  context 'class methods' do
    describe '::get_location' do
      it 'should return a location object' , :vcr do
          locale = "Denver,CO"
          location = LocationFacade.get_location(locale)
          expect(location).to be_a(Location)
      end

      it 'should return a direction object', :vcr do
        origin = "Denver,CO"
        destination = "Pueblo,CO"
        directions = LocationFacade.get_directions(origin, destination)
        expect(directions).to be_a(Direction)

      end
    end
  end
end
