# JSON API Resources for campaign model
class CampaignResource < JSONAPI::Resource
  attributes :title, :description
  belongs_to :user
  has_many :setting_details
  has_many :chapters
  has_many :characters
end
