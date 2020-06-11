class Tag < ApplicationRecord
  extend FriendlyId
  REGEX = /#[[:word:]]+/

  has_many :taggings, dependent: :destroy
  has_many :cheatsheets, through: :taggings

  scope :sorted, -> { order(:name) }

  friendly_id :name, use: :slugged
end
