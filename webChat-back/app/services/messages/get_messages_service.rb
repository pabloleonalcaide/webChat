require './lib/errors/RoomsNotFound'
require './app/models/room'
require './app/models/message'
class GetMessagesService
  def initialize()
  end
  # return last 20 messages from selected room
  def self.getLast(roomId)
    begin
      Rails.logger.debug("Recuperando últimos mensajes de la sala #{roomId}")
      messageList = Message.where(room: roomId).order_by(_id: :desc).limit(20);
      messageList
    rescue
      raise Errors::RoomsNotFound
    end
  end
end