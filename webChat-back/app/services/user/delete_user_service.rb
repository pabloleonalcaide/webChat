require './lib/errors/userDeleteError'
class DeleteUserService
  def initialize()
  end
  # delete user if exists
  def self.delete(userId)
    begin
      Rails.logger.debug("Eliminar usuario " + userId)
      User.where(id: userId).delete_all
    rescue
      raise Errors::UserDeleteError
    end
  end
end

