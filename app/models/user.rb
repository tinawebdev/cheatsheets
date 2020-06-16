class User < ApplicationRecord
  extend FriendlyId 

  USERNAME_VALIDATION = /\A[\w]+\z/

  has_many :cheatsheets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_cheatsheets, through: :favorites, source: :cheatsheet
  has_many :likes, dependent: :destroy
  has_many :liked_cheatsheets, through: :likes, source: :cheatsheet
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, 
                      length: { maximum: 40 }, 
                      format: { with: USERNAME_VALIDATION }, 
                      uniqueness: { case_sensitive: false }
  validates :bio, length: { maximum: 140 }

  before_validation :normalize_username

  friendly_id :username, use: :slugged

  private

  def normalize_username
    self.username&.downcase!
  end
end
