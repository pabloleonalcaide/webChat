require './lib/errors/roomExist'
class CreateRoomTestService
  def initialize()
  end
  # save the room if not being used
  def self.saveRoom(roomId, roomName)
    room = Rails.cache.read(roomName)
    if room.nil?
      Rails.cache.write(roomName,true)
    else
      raise Errors::RoomExist
    end
  end
end

