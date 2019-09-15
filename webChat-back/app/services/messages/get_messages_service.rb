require './lib/errors/RoomsNotFound'
require './app/models/room'
require './app/models/message'
class GetMessagesService
  def initialize()
  end
  def self.getLast(roomId)
    begin
      Message.find_by(room: roomId).limit(20)
    rescue
      raise Errors::RoomsNotFound
    end
  end
end