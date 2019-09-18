require './app/services/rooms/create_room_service'
module Rooms
  class RoomsPostRealController < RoomsPostController
    def initialize
      super(CreateRoomService)
    end
  end
end