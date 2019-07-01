# JSON API Resources for character model
class CharacterResource < JSONAPI::Resource
  attributes :name, :description, :pc_class, :level
  has_one :campaign
  has_one :user
end
