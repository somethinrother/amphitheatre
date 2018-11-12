# JSON API Resources for event model
class EventResource < JSONAPI::Resource
  attributes :description, :title, :character_ids, :location_ids
  has_one :chapter
end
