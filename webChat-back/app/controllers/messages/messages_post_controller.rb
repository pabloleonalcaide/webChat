require './lib/errors/messageError'
module Messages
  class MessagesPostController < ApplicationController 
    def initialize(service)
      @messageService = service
    end
    # POST /messages
    def create
      begin
        @user = params[:user]
        @room = params[:room]
        @message = params[:message]
        @messageService.saveMessage(@user, @room, @message)

        ActionCable.server.broadcast("chat_channel_#{params[:room]}",
          user: @user, 
          room: @room, 
          text: @message
        )
        response = {:user => @user, :room => @room, :text => @message}
        render :json => response.to_json, :status => 201
      rescue Errors::MessageError
        e = Errors::MessageError.new
        render :json => {message: e.message}, status: e.status
      end    
    end  
  end
end