class UserMongoRepository
  def initialize
    
  end

  def save(userDto)
    User.create!(name: userDto.name, id: userDto.id)
  end

  def searchById(id)
    User.find_by(id: request.params[id])
  end

  def delete(id)
    User.where(id: id).delete_all
  end

end