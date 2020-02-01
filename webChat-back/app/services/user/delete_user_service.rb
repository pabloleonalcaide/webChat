require './lib/errors/userDeleteError'
class DeleteUserService
  def initialize()
    @repository = userMongoRepository.new
  end
  # delete user if exists
  def self.delete(userId)
    begin
      Rails.logger.debug("Eliminar usuario " + userId)
      repository.delete(userId)
    rescue
      Rails.logger.error("Error al eliminar usuario " + userId)
      raise Errors::UserDeleteError
    end
  end
end

