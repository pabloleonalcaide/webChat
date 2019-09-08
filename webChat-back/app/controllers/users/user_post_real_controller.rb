require './app/services/user/create_user_service'
module Users
  class Users::UserPostRealController < UserPostController
    def initialize
      super(CreateUserService)
    end
  end
end