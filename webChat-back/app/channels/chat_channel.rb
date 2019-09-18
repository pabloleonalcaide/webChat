class ChatChannel < ApplicationCable::ChatChannel

  def subscribed
    Rails.logger.debug("Subscribed")
    stream_from "ChatChannel"
  end

  def unsubscribed
  end
  
  def receive(data)
    # message = Message.new(:message: data['message'], :user: data['user'], :room: data['room'])
    # message.create!
    # ActionCable.server.broadcast('ChatChannel',data)
  end
end