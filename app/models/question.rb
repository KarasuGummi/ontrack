class Question < ApplicationRecord
  belongs_to :project
  has_many :answers, dependent: :destroy
end
