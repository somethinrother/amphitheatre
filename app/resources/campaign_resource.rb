# JSON API Resources for campaign model
class CampaignResource < JSONAPI::Resource
  attributes :title, :description
  has_one :user
  has_many :chapters
  has_many :characters
  has_many :locations
  has_many :setting_details
end
