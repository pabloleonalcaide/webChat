require './lib/errors/userExist'
class CreateUserService
  def initialize()
  end
  # save the user if not being used
  def self.saveUser(userName, userId)
    begin
      Rails.logger.debug("Registrando usuario " + userName)
      User.create!(name: userName, id: userId)
    rescue
      raise Errors::UserExist
    end
  end
end

