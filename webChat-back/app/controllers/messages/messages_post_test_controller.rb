require './app/services/messages/create_message_test_service'
module Messages
  class MessagesPostTestController < MessagesPostController
    def initialize
      super(CreateMessageTestService)
    end
  end
end