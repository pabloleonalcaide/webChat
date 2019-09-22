class Message
  include Mongoid::Document
  field :text, type: String
  field :room, type: String
  field :user, type: String
end
