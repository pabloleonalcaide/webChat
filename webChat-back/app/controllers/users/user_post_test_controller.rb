require './app/services/user/create_user_test_service'
module Users
  class UserPostTestController < UserPostController
    def initialize
      super(CreateUserTestService)
    end
  end
end