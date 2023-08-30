

class
   Buddy < ApplicationRecord
  has_one :user, dependent: :destroy
  # belongs_to :user
  has_many_attached :photos
  attr_accessor :treat
end
