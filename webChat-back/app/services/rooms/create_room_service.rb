require './lib/errors/roomExist'
class CreateRoomService
  def initialize()
  end
  # save the user if not being used
  def self.saveRoom(roomId, roomName)
    begin
      Room.create!(id: roomId, name: roomName)
    rescue
      raise Errors::roomExist
    end
  end
end

