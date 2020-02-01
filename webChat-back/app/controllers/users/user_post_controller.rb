require './lib/errors/userExist'
require './app/dto/userDto'

module Users
  class UserPostController < ApplicationController 
    # POST /user
    def initialize(service)
      @userService = service
    end

    def create
      begin
        userName = params[:name]
        userId = params[:id]
        userDto = Dto::UserDto.new(userId,userName)
        @userService.saveUser(userDto)
        render :json => {message: userName}, status: 201
      rescue Errors::UserExist
        e = Errors::UserExist.new
        render :json => {message: e.message}, status: e.status
      end    
    end
  end
end