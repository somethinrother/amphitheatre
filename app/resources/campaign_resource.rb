# JSON API Resources for campaign model
class CampaignResource < JSONAPI::Resource
  attributes :title, :description
  belongs_to :user
end
