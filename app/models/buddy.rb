class Buddy < ApplicationRecord
  # has_one :user, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  def associated_user
    user
  end
end
