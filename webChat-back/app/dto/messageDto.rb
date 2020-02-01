module Dto
  class MessageDto
    def initialize(text,room,user)
      @text = text
      @room = room
      @user = user
    end

    def text
      @text
    end

    def room
      @room
    end
    
    def user
      @user
    end
  end
end