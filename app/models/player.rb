class Player < ApplicationRecord
  ROLES = %w[GM PC].freeze

  belongs_to :campaign
  belongs_to :user

  validates_presence_of %i[role]
  validates :role, inclusion: { in: ROLES,
    message: "%{value} is not valid. Role must be either GM or PC" }
end
