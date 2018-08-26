# Campaigns house all the data about an individual game
class Campaign < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description
end
