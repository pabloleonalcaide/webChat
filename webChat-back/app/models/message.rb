class Message
  include Mongoid::Document
  field :text, type: String
  field :room, type: String
  field :user, type: String
  validates :text, presence: true
  validates :room, presence: true
  validates :user, presence: true
end
