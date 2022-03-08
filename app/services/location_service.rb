class LocationService

  def self.connection
    url = "http://www.mapquestapi.com/geocoding/v1/address?"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['map_api_key']
    end
  end

  def self.get_location(location)
    response = connection.get do |faraday|
      faraday.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.direction_connection
    url = "http://www.mapquestapi.com/directions/v2/route?"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['map_api_key']
    end
  end

  def self.get_directions(origin, destination)
    response = direction_connection.get do |faraday|
      faraday.params['from'] = origin
      faraday.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
