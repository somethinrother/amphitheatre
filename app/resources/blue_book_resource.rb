# JSON API Resources for blue book model
class BlueBookResource < JSONAPI::Resource
  attributes :title, :body, :reward
  has_one :chapter
  has_one :character
end
