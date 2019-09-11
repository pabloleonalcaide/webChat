require './lib/errors/roomExist'
class CreateRoomService
  def initialize()
  end
  # save the user if not being used
  def self.saveRoom(roomName)
    begin
      Room.create!(name: roomName)
    rescue
      raise Errors::roomExist
    end
  end
end

