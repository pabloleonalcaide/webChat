require './lib/errors/messageError'
class CreateMessageService
  def initialize()
  end
  # persist a messages on DB
  def self.saveMessage(user, room, message)
    begin
      Rails.logger.debug("Registrando mensaje: [ " + message + " ]")
      Message.create!(text: message, room:room, user:user)
    rescue
      Rails.logger.errors("Error registrando un nuevo mensaje")
      raise Errors::MessageError
    end
  end
end

