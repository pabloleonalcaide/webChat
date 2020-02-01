class RoomMongoRepository
  def initialize
    
  end

  def save(roomDto)
    Room.create!(id: roomDto.id, name: roomDto.name)
  end

  def getAll
    Room.all
  end
end