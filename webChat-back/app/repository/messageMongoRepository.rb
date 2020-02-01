class MessageMongoRepository
  def initialize
    
  end

  def save(messageDto)
    Message.create!(text: messageDto.text, room: messageDto.room, user: messageDto.user)
  end

  def findByRoom(roomId)
    Message.where(room: roomId).order_by(_id: :desc).limit(20);
  end
end