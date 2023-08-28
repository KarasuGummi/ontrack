class Project < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy

  enum status: { pending: 0, accepted: 1, completed: 2, declined: 3 }, _default: 0
end
