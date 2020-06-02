class Cheatsheet < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 20000 }

  scope :public_cheatsheets, -> { where("public = ?", true).order(updated_at: :desc) }

  def recently_created?
    created_at >= 24.hour.ago
  end

  def recently_updated?
    !recently_created? && updated_at >= 3.days.ago
  end

  def private?
    public == false
  end
end
