# Model representing the user
class User < ApplicationRecord
  has_secure_password
end
