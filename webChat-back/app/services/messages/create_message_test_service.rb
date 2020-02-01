require './lib/errors/messageError'
class CreateMessageTestService
  def initialize()
  end
  def self.saveMessage(messageDto)
    text = Rails.cache.read(messageDto.text)
    if text.nil?
      Rails.cache.write(messageDto.text,true)
    else
      raise Errors::MessageError
    end
  end
end

