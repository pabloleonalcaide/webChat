require './lib/errors/RoomsNotFound'
require './app/models/room'
require './app/models/message'
class GetMessagesService
  def initialize()
  end
  def self.getLast(roomId)
    begin
      # messageList = Message.find_by(room: roomId).limit(20)
      messageList = Message.where(room: roomId).limit(20)
      messageList
    rescue
      raise Errors::RoomsNotFound
    end
  end
end