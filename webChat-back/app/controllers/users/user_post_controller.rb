require './lib/errors/userExist'
module Users
  class UserPostController < ApplicationController 
  include Response
    # POST /user
    def initialize(service)
      @userService = service
    end
    def create
      begin
        userName = params[:name]
        @userService.saveUser(userName)
        render :json => {message: userName}, status: 201
      rescue Errors::UserExist
        e = Errors::UserExist.new
        render :json => {message: e.message}, status: e.status
      end    
    end
    
  end
end