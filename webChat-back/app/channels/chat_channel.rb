class ChatChannel < ApplicationCable::ChatChannel

  def subscribed
    Rails.logger.debug("Subscribed")
    stream_from "ChatChannel#{current_user.id}"
  end

  def unsubscribed
  end
  
  def receive(data)
  end
end