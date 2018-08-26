# Model representing the user
class User < ApplicationRecord
  has_secure_password

  has_many :campaigns

  validates_presence_of :username, :email
end
