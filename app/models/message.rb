class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user, class_name: 'User'

  validates :user, presence: true
end
