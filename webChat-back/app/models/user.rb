class User
  include Mongoid::Document
  field :id, type: String
  field :name, type: String
  validates :name, presence: true, uniqueness: true
end
