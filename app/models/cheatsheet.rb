class Cheatsheet < ApplicationRecord
  belongs_to :user

  def recently_created
    self.created_at >= 24.hour.ago
  end

  def recently_updated
    self.updated_at >= 3.days.ago
  end
end
