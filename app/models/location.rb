# A location within a given campaign
class Location < ApplicationRecord
  belongs_to :campaign

  validates_presence_of %i[name description]
end
