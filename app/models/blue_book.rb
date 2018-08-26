# User generated storyline content
class BlueBook < ApplicationRecord
  belongs_to :chapter
  belongs_to :character

  validates_presence_of %i[title body]
end
