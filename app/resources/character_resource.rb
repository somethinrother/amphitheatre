# JSON API Resources for character model
class CharacterResource < JSONAPI::Resource
  attributes :name, :description, :pc_class, :level
  belongs_to :campaign
  belongs_to :user
end
