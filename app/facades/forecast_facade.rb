class ForecastFacade
  def self.get_forecast(lat, lng)
    forecast = ForecastService.get_forecast(lat, lng)
  end
end
