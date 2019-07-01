class Player < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates_presence_of %i[role]
end
