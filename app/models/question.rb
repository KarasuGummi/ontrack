class Question < ApplicationRecord
  belongs_to :project
  has_many :answers, dependent: :delete_all
end
