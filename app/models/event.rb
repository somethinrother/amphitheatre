# An event. Takes place within a chapter and can reference characters
# and/or locations through an array of ids
class Event < ApplicationRecord
  serialize :character_ids, Array
  serialize :location_ids, Array

  belongs_to :chapter

  validates_presence_of %i[title description]
end
