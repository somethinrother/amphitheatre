# A meaningful chapter of content within a campaign
class Chapter < ApplicationRecord
  has_many :blue_books

  belongs_to :campaign

  validates_presence_of %i[title description]
end
