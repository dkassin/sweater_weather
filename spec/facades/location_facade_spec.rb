require 'rails_helper'

RSpec.describe LocationFacade, type: :facade do
  context 'class methods' do
    describe '::get_location' do
      it 'should return a location object' do
          locale = "Denver,CO"
          location = LocationFacade.get_location(locale)
          expect(location).to be_a(Location)
      end
    end
  end
end
