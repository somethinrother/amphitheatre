# Model representing the user
class User < ApplicationRecord
  has_secure_password

  has_many :campaigns

  validates_presence_of %i[username email]
end
