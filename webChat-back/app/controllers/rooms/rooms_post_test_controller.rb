require './app/services/rooms/create_room_test_service'
module Rooms
  class RoomsPostTestController < RoomsPostController
    def initialize
      super(CreateRoomTestService)
    end
  end
end