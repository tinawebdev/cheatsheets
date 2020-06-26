class Tag < ApplicationRecord
  extend FriendlyId
  REGEX = /#[[:word:]]+/
  MAIN_TAGS = %w[
                  #algorithms #api #bash #backend #css #frontend #git #gulp 
                  #html #javascript #jquery #laravel #less #linux #markdown 
                  #mysql #nodejs #php #rails #react #regexp #ruby #sass #scss 
                  #sql #sublime #ubuntu #vscode #vuejs #webdev #wordpress
                ]

  has_many :taggings, dependent: :destroy
  has_many :cheatsheets, through: :taggings
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  scope :sorted, -> { order(:name) }

  friendly_id :name, use: :slugged
end
