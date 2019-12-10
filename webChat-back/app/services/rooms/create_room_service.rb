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
      Rails.logger.error("Error al insertar la sala " + roomName + "En Base de Datos")
      raise Errors::RoomExist
    end
  end
end

