require './app/services/messages/get_messages_service'
module Messages
  class MessagesGetRealController < MessagesGetController
    def initialize
      super(GetMessagesService)
    end
  end
end