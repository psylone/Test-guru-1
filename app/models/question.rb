class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :test, :body, presence: true
end
