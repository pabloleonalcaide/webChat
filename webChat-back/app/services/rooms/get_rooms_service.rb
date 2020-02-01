require './lib/errors/RoomsNotFound'
require './app/models/room'

class GetRoomsService
  def initialize()
    @repository = RoomMongoRepository.new
  end
  # return all the rooms
  def self.get(hasRooms = true)
    begin
      Rails.logger.debug('Recuperando salas disponibles')
      @repository.getAll
    rescue
      Rails.logger.error('Error tratando de recuperar las salas disponibles')
      raise Errors::RoomsNotFound
    end
  end
end