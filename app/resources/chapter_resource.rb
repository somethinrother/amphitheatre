# JSON API Resources for chapter model
class ChapterResource < JSONAPI::Resource
  attributes :title, :description
  belongs_to :campaign
  has_many :blue_books
end
