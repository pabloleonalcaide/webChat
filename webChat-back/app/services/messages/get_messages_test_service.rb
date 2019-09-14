require './lib/errors/RoomsNotFound'
require './app/models/room'
require './app/models/message'
class GetMessagesService
  def initialize()
  end
  
  def self.getLast(roomId)
    getMockedMessages()
  end

  private
  def getMockedMessages()
    [
      {text: 'message 1', room: 'room_test_1', user: 'user 1'},
      {text: 'message 2', room: 'room_test_2', user: 'user 2'},
      {text: 'message 3', room: 'room_test_3', user: 'user 3'},
      {text: 'message 4', room: 'room_test_4', user: 'user 4'},
      {text: 'message 5', room: 'room_test_5', user: 'user 5'},
      {text: 'message 6', room: 'room_test_6', user: 'user 6'},
      {text: 'message 7', room: 'room_test_7', user: 'user 7'},
      {text: 'message 8', room: 'room_test_8', user: 'user 8'},
      {text: 'message 9', room: 'room_test_9', user: 'user 9'},
      {text: 'message 10', room: 'room_test_10', user: 'user 10'},
      {text: 'message 11', room: 'room_test_11', user: 'user 11'},
    ]
  end
end