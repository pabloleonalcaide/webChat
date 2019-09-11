require './lib/errors/roomExist'
module Rooms
  class RoomsPostController < ApplicationController 
  include Response
    def initialize(service)
      @roomService = service
    end
    # POST /rooms
    def create
      begin
        roomName = params[:name]
        @roomService.saveRoom(roomName)
        render :json => {message: roomName}, status: 201
      rescue Errors::RoomExist
        e = Errors::RoomExist.new
        render :json => {message: e.message}, status: e.status
      end    
    end
    
  end
end