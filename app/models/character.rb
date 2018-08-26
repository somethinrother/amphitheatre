# A character, played by either a user or a gm
class Character < ApplicationRecord
  has_many :blue_books

  belongs_to :user
  belongs_to :campaign

  validates_presence_of %i[name description pc_class level]
end
