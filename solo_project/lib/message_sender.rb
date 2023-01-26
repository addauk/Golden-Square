require 'twilio-ruby'

class MessageSender

  def self.send
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    time = time_dif
    message = @client.messages
      .create(
        body: "Thank you! Your order was placed and will be delivered before #{time}",
        from: ENV['MY_TWILIO_NUM'],
        to: ENV['MY_NUM']
      )

    #puts message.sid
  end

  private

  def self.time_dif
    
    return (Time.now + 1*60*60).strftime("%H:%M")
    
  end

end
