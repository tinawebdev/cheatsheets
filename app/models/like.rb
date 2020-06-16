class Like < ApplicationRecord
  belongs_to :cheatsheet
  belongs_to :user
end
