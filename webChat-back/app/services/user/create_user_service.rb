require './lib/errors/userExist'
require './app/dto/userDto'
class CreateUserService
  def initialize()
    @repository = UserMongoRepository.new
  end
  # save the user if not being used
  def self.saveUser(userDto)
    begin
      Rails.logger.debug("Registrando usuario " + userDto.name)
      @repository.save(userDto)
    rescue
      Rails.logger.error("Error registrando usuario " + userDto.name)
      raise Errors::UserExist
    end
  end
end
