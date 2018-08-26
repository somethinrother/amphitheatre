# JSON API Resources for user model
class UserResource < JSONAPI::Resource
  attributes :username, :email

  has_many :campaigns
end
