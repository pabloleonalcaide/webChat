require './app/services/user/delete_user_service'
class ChatChannel < ApplicationCable::Channel

  def subscribed
    Rails.logger.debug("Subscribed on ChatChannel")
    stream_from "chat_channel_#{params['room']}"
  end

  def unsubscribed
    Rails.logger.debug("Unsubscribed from ChatChannel")
    DeleteUserService.delete(current_user.id)
  end
  
  def receive(data)
  end
end