require './lib/errors/RoomsNotFound'
require './app/models/room'
class GetRoomsService
  def initialize()
  end
  def self.get(hasRooms = true)
    begin
      Rails.logger.debug('Recuperando salas disponibles')
      Room.all
    rescue
      raise Errors::RoomsNotFound
    end
  end
end