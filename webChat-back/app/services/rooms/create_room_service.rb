require './lib/errors/roomExist'
class CreateRoomService
  def initialize()
    @repository = RoomMongoRepository.new
  end
  # save the room if not being used
  def self.saveRoom(roomDto)
    begin
      Rails.logger.debug("Insertando sala " + roomDto.name + " con id " + roomDto.id)
      @repository.save(roomDto)
    rescue
      Rails.logger.error("Error al insertar la sala " + roomName + "En Base de Datos")
      raise Errors::RoomExist
    end
  end
end

