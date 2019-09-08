require './app/services/rooms/get_rooms_service'
module Rooms
  class Rooms::RoomsGetRealController < RoomsGetController
    def initialize
      super(GetRoomsService)
    end
  end
end