require './app/services/messages/create_message_service'
module Messages
  class MessagesPostRealController < MessagesPostController
    def initialize
      super(CreateMessageService)
    end
  end
end