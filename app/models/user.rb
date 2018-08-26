# Model representing the user
class User < ApplicationRecord
  has_secure_password

  has_many :campaigns
  has_many :characters

  validates_presence_of %i[username email]
end
