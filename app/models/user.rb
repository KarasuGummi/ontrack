class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :buddy
  has_many :projects, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  has_many :answers, through: :user_answers
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :messages, dependent: :destroy

  has_one_attached :photo

  attribute :points, :integer, default: 0
  def earn_points(points)
    update(points: points + self.points)
  end

  def interest_updated_recently?
    latest_interest_update = self.user_interests.order(updated_at: :desc).first&.updated_at
    latest_interest_update && latest_interest_update > 1.minute.ago
  end
end
