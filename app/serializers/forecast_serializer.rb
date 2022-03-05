class ForecastSerializer

  def self.forecast_serializer(forecast)

    {
      "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": Time.at(forecast[:current][:dt]),
            "sunrise": Time.at(forecast[:current][:sunrise]),
            "sunset": Time.at(forecast[:current][:sunset]),
            "temperature": forecast[:current][:temp],
            "feels_like": forecast[:current][:feels_like],
            "humidity": forecast[:current][:humidity],
            "uvi": forecast[:current][:uvi],
            "visibility": forecast[:current][:visibility],
            "conditions": forecast[:current][:weather][0][:description],
            "icon": forecast[:current][:weather][0][:icon],
          },

          "daily_weather": forecast[:daily].shift(5).map do |day|
            {
              "date": Date.jd(day[:dt]),
              "sunrise": Time.at(day[:sunrise]),
              "sunset": Time.at(day[:sunrise]),
              "max_temp": day[:temp][:max],
              "min_temp": day[:temp][:min],
              "min_temp": day[:temp][:min],
              "conditions": day[:weather][0][:description],
              "icon": day[:weather][0][:icon]
            }
            end
          ,
          "hourly_weather": forecast[:hourly].shift(8).map do |hour|
            {
              "time": Time.at(hour[:dt]),
              "temp": hour[:temp],
              "conditions": hour[:weather][0][:description],
              "icon": hour[:weather][0][:icon]
            }
            end
        }
      }
    }
  end
end
