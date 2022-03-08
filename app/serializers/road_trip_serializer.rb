class RoadTripSerializer
  def self.road_trip_serializer(forecast, travel)
        {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "start_city": "Denver, CO",
          "end_city": "Estes Park, CO",
          "travel_time": "2 hours, 13 minutes"
          "weather_at_eta": {
            "temperature": 59.4,
            "conditions": "partly cloudy with a chance of meatballs"
          }
        }
      }
    }
  end
end
