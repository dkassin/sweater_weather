class ForecastService

  def self.connection
    url = "https://api.openweathermap.org/data/2.5/onecall?"
    Faraday.new(url: url) do |faraday|
      faraday.params['appid'] = ENV['weather_api']
    end
  end

  def self.get_forecast(lat,lng)
    response = connection.get do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = lng
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
