# JSON API Resources for location model
class LocationResource < JSONAPI::Resource
  attributes :name, :description
  has_one :campaign
end
