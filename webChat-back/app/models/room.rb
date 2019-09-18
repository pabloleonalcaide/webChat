class Room
  include Mongoid::Document
  field :id, type: String
  field :name, type: String
  validates :name, presence: true, uniqueness: true
  validates :id, presence:true, uniqueness: true
  has_many :messages
end
