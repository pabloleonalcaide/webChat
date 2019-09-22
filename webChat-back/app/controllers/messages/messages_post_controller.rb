require './lib/errors/messageError'
module Messages
  class MessagesPostController < ApplicationController 
  include Response
    def initialize(service)
      @messageService = service
    end
    # POST /messages
    def create
      begin
        user = params[:user]
        room = params[:room]
        message = params[:message]
        @messageService.saveMessage(user, room, message)
        render :json => {message: message}, status: 201
      rescue Errors::MessageError
        e = Errors::MessageError.new
        render :json => {message: e.message}, status: e.status
      end    
    end  
  end
end