require './lib/errors/userExist'

class CreateUserTestService
  def initialize()
  end
  # save the user if not being used
  def self.saveUser(userDto)
    currentUser = Rails.cache.read(userDto.name)
    if currentUser.nil?
      Rails.cache.write(userDto.name,true)
    else
      raise Errors::UserExist
    end 
  end
end

