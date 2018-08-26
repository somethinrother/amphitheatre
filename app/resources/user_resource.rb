# JSON API Resources for user model
class UserResource < JSONAPI::Resource
  attributes :username, :email, :password_digest
end
