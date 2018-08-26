# JSON API Resources for blue book model
class BlueBookResource < JSONAPI::Resource
  attributes :title, :body, :email, :reward
  belongs_to :chapter
  belongs_to :character
end
