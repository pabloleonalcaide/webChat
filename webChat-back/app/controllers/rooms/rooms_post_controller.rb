require './lib/errors/roomExist'
require './app/dto/roomDto'

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
        roomDto = Dto::RoomDto.new(roomId, roomName)
        @roomService.saveRoom(roomDto)
        render :json => {message: roomName}, status: 201
      rescue Errors::RoomExist
        e = Errors::RoomExist.new
        render :json => {message: e.message}, status: e.status
      end    
    end  
  end
end