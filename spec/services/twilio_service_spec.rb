
require 'rails_helper'

RSpec.describe 'Twilio Service' do
  it 'returns a positive response from Twilio' , :vcr do
      connection = TwilioService.connection
      expect(connection).to be_a(Twilio::REST::Client)
  end

  it 'returns a message', :vcr do
    number = "7733920487"
    message = TwilioService.create_message(number)

    expect(message.sid).to be_a String
    binding.pry
  end
end
