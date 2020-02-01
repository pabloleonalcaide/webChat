require './lib/errors/roomExist'
class CreateRoomTestService
  def initialize()
  end
  # save the room if not being used
  def self.saveRoom(roomDto)
    room = Rails.cache.read(roomDto.name)
    if room.nil?
      Rails.cache.write(roomDto.name,true)
    else
      raise Errors::RoomExist
    end
  end
end

