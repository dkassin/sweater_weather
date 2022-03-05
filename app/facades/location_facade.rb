class LocationFacade
  def self.get_location(location)
    location = LocationService.get_location(location)
    Location.new(location[:results][0][:locations][0][:latLng])
  end
end
