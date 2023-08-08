class Project < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :delete_all

  enum status: { pending: 0, accepted: 1, completed: 2 }, _default: 0
end
