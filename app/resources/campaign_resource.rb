# JSON API Resources for campaign model
class CampaignResource < JSONAPI::Resource
  attributes :title, :description
  has_one :user
  has_many :chapters
  has_many :locations
end
