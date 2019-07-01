# JSON API Resources for player model
class PlayerResource < JSONAPI::Resource
  attributes :role
  has_one :campaign
  has_one :user
end
