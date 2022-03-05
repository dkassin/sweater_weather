class BackgroundService

  def self.connection
    url = "https://api.pexels.com/v1/search?"
    Faraday.new(url: url, headers: {"Authorization": ENV['image_api']})

  end

  def self.get_image(location)
    response = connection.get do |faraday|
      faraday.params['query'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
