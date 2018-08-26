# JSON API Resources for setting detail model
class SettingDetailResource < JSONAPI::Resource
  attributes :title, :description
  belongs_to :campaign
end
