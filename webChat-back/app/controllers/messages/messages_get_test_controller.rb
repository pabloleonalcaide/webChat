require './app/services/messages/get_messages_test_service'
module Messages
  class MessagesGetTestController < MessagesGetController
    def initialize
      super(GetMessagesTestService)
    end
  end
end