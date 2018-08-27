# JSON API Resources for user model
class UserResource < JSONAPI::Resource
  attributes :username, :email, :password, :password_confirmation

  has_many :campaigns

  def self.fields
    super - %i[password password_confirmation]
  end
end
