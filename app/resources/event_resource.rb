# JSON API Resources for event model
class EventResource < JSONAPI::Resource
  attributes :description, :title
  has_one :chapter
end
