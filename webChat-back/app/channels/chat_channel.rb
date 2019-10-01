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
    # message = Message.new(:message: data['message'], :user: data['user'], :room: data['room'])
    # message.create!
    # ActionCable.server.broadcast('ChatChannel',data)
  end
end