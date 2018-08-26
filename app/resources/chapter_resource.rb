# JSON API Resources for chapter model
class ChapterResource < JSONAPI::Resource
  attributes :title, :description
  has_one :campaign
  has_many :blue_books
end
