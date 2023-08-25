class Buddy < ApplicationRecord
  has_one :user, dependent: :destroy
  # belongs_to :user
  has_many_attached :photos
  CATEGORIES = ["Ruby", "JavaScript", "CSS"]
end
