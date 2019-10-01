require './lib/errors/roomExist'
module Rooms
  class RoomsPostController < ApplicationController 
    def initialize(service)
      @roomService = service
    end
    # POST /rooms
    def create
      begin
        roomName = params[:name]
        roomId = params[:id]
        @roomService.saveRoom(roomId, roomName)
        render :json => {message: roomName}, status: 201
      rescue Errors::RoomExist
        e = Errors::RoomExist.new
        render :json => {message: e.message}, status: e.status
      end    
    end  
  end
end