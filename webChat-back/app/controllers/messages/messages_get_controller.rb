require './lib/errors/RoomNotFound'
module Messages
  class MessagesGetController < ApplicationController 
  include Response
    def initialize(service)
      @messageService = service
    end

    def list
      begin
        roomId = params[:roomId]
        messages = @messageService.getLast(roomId)
        render :json => {message: messages}, status: 200
      rescue Errors::RoomNotFound
        e = Errors::RoomNotFound.new
        render :json => {message: e.message}, status: e.status
      end    
    end
    
  end
end