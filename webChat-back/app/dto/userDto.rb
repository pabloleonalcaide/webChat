module Dto
  class UserDto
    def initialize(id,name)
        @id = id
        @name = name
    end
    
    def id
      @id
    end

    def name
      @name
    end
  end
end