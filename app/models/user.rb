class User < ApplicationRecord
  extend FriendlyId 

  USERNAME_VALIDATION = /\A[\w]+\z/

  has_many :cheatsheets, dependent: :destroy

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
