class Tag < ApplicationRecord
  extend FriendlyId
  REGEX = /#[[:word:]]+/

  has_many :taggings, dependent: :destroy
  has_many :cheatsheets, through: :taggings
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  scope :sorted, -> { order(:name) }

  friendly_id :name, use: :slugged
end
