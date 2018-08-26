# JSON API Resources for setting detail model
class SettingDetailResource < JSONAPI::Resource
  attributes :title, :description
  has_one :campaign
end
