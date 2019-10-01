require './lib/errors/RoomsNotFound'
module Rooms
  class RoomsGetController < ApplicationController 
    def initialize(service)
      @roomsService = service
    end

    def list
      begin
        rooms = @roomsService.get
        render :json => {message: rooms}, status: 200
      rescue Errors::RoomsNotFound
        e = Errors::RoomsNotFound.new
        render :json => {message: e.message}, status: e.status
      end    
    end
    
  end
end