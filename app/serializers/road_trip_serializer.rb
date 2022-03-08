class RoadTripSerializer
  def self.road_trip_serializer(directions, forecast_hour, origin, destination)
        {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": "#{directions.hour} hours, #{directions.min} minutes",
          "weather_at_eta": {
            "temperature": forecast_hour[:temp],
            "conditions": forecast_hour[:weather][0][:description]
          }
        }
      }
    }
  end
end
