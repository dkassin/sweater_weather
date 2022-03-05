class BackgroundFacade
  def self.get_image(location)
    image = BackgroundService.get_image(location)
  end
end
