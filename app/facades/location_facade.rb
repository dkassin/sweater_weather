class LocationFacade
  def self.get_location(location)
    location = LocationService.get_location(location)
    Location.new(location[:results][0][:locations][0][:latLng])
  end

  def self.get_directions(origin, destination)
    directions = LocationService.get_directions(origin, destination)
    if directions[:info][:statuscode] == 402
      Invalid.new(directions)
    else
      binding.pry
      Direction.new(directions)
    end
  end
end
