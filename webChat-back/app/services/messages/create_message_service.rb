require './lib/errors/messageError'
class CreateMessageService
  def initialize()
  end
  # persist a messages on DB
  def self.saveMessage(messageDto)
    begin
      Rails.logger.debug("Registrando mensaje: [ " + messageDto.text + " ]")
      
      @repository.save(messageDto)
    rescue
      Rails.logger.errors("Error registrando un nuevo mensaje")
      raise Errors::MessageError
    end
  end
end

