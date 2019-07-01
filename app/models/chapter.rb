# A meaningful chapter of content within a campaign
class Chapter < ApplicationRecord
  belongs_to :campaign

  has_many :events

  validates_presence_of %i[title description]
end
