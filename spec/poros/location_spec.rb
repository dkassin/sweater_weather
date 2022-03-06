require 'rails_helper'

RSpec.describe "Location object" do
  it 'exists' do
  location = {:lat=>39.738453, :lng=>-104.984853}

  location = Location.new(location)
  expect(location).to be_a Location
  expect(location.lat).to eq(39.738453)
  expect(location.lng).to eq(-104.984853)
  end
end
