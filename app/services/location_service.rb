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
end
