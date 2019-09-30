class ChatChannel < ApplicationCable::Channel

  def subscribed
    Rails.logger.debug("Subscribed on ChatChannel")
    stream_from "chat_channel_#{params['room']}"
  end

  def unsubscribed
    Rails.logger.debug("Unsubscribed from ChatChannel")
    Rails.logger.debug("Unsubscribed user: ")
    puts(current_user.name)
    puts(current_user.id)
    puts(current_user['name'])
  end
  
  def receive(data)
  end
end