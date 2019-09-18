require './lib/errors/RoomsNotFound'
require './app/models/room'
require './app/models/message'
class GetMessagesService
  def initialize()
  end
  def self.getLast(roomId)
    begin
      message = Message.find_by(room: roomId).limit(20)
      message
    rescue
      raise Errors::RoomsNotFound
    end
  end
end