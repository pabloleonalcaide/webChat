class Message
  include Mongoid::Document
  field :text, type: String
  field :room, type: Reference
  field :user, type: Reference
end
