require './lib/errors/userExist'
class CreateUserTestService
  def initialize()
  end
  # save the user if not being used
  def self.saveUser(userName)
    user = Rails.cache.read(userName)
    if user.nil?
      Rails.cache.write(userName,true)
    else
      raise Errors::UserExist
    end 
  end
end

