# Campaigns house all the data about an individual game
class Campaign < ApplicationRecord
  belongs_to :user

  has_many :setting_details

  validates_presence_of :title, :description
end
