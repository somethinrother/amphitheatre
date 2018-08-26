# Campaigns house all the data about an individual game
class Campaign < ApplicationRecord
  belongs_to :user

  has_many :setting_details
  has_many :chapters
  has_many :characters

  validates_presence_of %i[title description]
end
