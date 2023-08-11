class Buddy < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many_attached :photos
end
