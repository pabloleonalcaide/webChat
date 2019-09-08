require './app/services/rooms/get_rooms_test_service'
module Rooms
  class RoomsGetTestController < RoomsGetController
    def initialize
      super(GetRoomsTestService)
    end
  end
end