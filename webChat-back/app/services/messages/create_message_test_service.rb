require './lib/errors/messageError'
class CreateMessageTestService
  def initialize()
  end
  def self.saveMessage(user, room, message)
    text = Rails.cache.read(message)
    if text.nil?
      Rails.cache.write(message,true)
    else
      raise Errors::MessageError
    end
  end
end

