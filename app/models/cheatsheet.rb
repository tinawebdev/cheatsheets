class Cheatsheet < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
  validates :hashtags, length: { maximum: 65 }

  after_save :create_hashtags
  after_commit :destroy_unused_hashtags, on: [:update, :destroy]

  scope :public_cheatsheets, -> { where("public = ?", true).order(updated_at: :desc) }

  def recently_created?
    created_at >= 24.hours.ago
  end

  def recently_updated?
    updated_at >= 3.days.ago
  end

  def private?
    public == false
  end

  private

  def create_hashtags
    self.tags =
      hashtags.downcase.scan(Tag::REGEX).uniq.map do |tag|
        Tag.find_or_create_by(name: tag)
    end
  end

  def destroy_unused_hashtags
    Tag.includes(:cheatsheets).where(cheatsheets: {id: nil}).destroy_all
  end
end
