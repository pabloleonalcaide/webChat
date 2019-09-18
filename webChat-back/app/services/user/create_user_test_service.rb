require './lib/errors/userExist'
class CreateUserTestService
  def initialize()
  end
  # save the user if not being used
  def self.saveUser(name, id)
    currentUser = Rails.cache.read(name)
    if currentUser.nil?
      Rails.cache.write(name,true)
    else
      raise Errors::UserExist
    end 
  end
end

