require './lib/errors/roomExist'
class CreateRoomService
  def initialize()
  end
  # save the room if not being used
  def self.saveRoom(roomId, roomName)
    begin
      Rails.logger.debug("Insertando sala " + roomName + " con id " + roomId)
      Room.create!(id: roomId, name: roomName)
    rescue
      puts $!.message
      raise Errors::RoomExist
    end
  end
end

