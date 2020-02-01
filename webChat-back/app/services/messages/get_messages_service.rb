require './lib/errors/RoomsNotFound'
require './app/models/room'
require './app/models/message'
class GetMessagesService
  def initialize()
    @repository = MessageMongoRepository.new
  end
  # return last 20 messages from selected room
  def self.getLast(roomId)
    begin
      Rails.logger.debug("Recuperando últimos mensajes de la sala #{roomId}")
      messageList = @repository.findByRoom(roomId)
      messageList
    rescue
      raise Errors::RoomsNotFound
    end
  end
end