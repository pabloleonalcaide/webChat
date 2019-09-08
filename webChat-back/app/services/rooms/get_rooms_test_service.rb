require './lib/errors/RoomsNotFound'
require './app/models/room'
class GetRoomsTestService
  def initialize()
  end
  def self.get(hasRooms = true)
    rooms = [Room.new, Room.new, Room.new, Room.new]
    rooms 
  end
end

