module Errors
  class UserDeleteError < StandardError
    def initialize
      @message = 'El usuario no pudo eliminarse'
      @status = 403
    end

    def to_h
      {
        status: status,
        message: :message
      }
    end

    def serializable_hash
      to_h
    end

    def to_s
      to_h.to_s
    end
    attr_reader :message, :status
  end
end