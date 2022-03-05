class BackgroundSerializer
  def self.image_serializer(background, location)
    {
    "data": {
      "type": "image",
      "id": nil,
      "attributes": {
        "image": {
          "location": location,
          "image_url": background[:photos][0][:url],
          "credit": {
            "source": background[:photos][0][:photographer_url],
            "author": background[:photos][0][:photographer],
            "logo": background[:photos][0][:src][:original]
            }
          }
        }
      }
    }
  end
end
