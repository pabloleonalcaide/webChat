require './lib/errors/RoomsNotFound'
require './app/models/room'
class GetRoomsService
  def initialize()
  end
  def self.get(hasRooms = true)
    begin
      Room.all
    rescue
      raise Errors::RoomsNotFound
    end
  end
end