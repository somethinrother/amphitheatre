# Details about a given campaign
class SettingDetail < ApplicationRecord
  belongs_to :campaign

  validates_presence_of %i[title description]
end
