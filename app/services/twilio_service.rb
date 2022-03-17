class TwilioService

  def self.connection
    @client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_auth_token']
  end

  def self.create_message(number)
    response = connection.messages.create(
      body: "You have logged into your account",
      messaging_service_sid: 'MGb60e509161592abee5fa9c53245455ba',
      to: "+1#{number}"
    )
  end
end
