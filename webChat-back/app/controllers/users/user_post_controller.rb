require './lib/errors/userExist'
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
        @userService.saveUser(userName,userId)
        render :json => {message: userName}, status: 201
      rescue Errors::UserExist
        e = Errors::UserExist.new
        render :json => {message: e.message}, status: e.status
      end    
    end
    
  end
end