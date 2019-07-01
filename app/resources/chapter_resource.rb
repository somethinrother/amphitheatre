# JSON API Resources for chapter model
class ChapterResource < JSONAPI::Resource
  attributes :title, :description
  has_one :campaign
end
