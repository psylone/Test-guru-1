class User < ApplicationRecord
  has_many :completed_tests
  has_many :tests, through: :completed_tests
  has_many :tests_by_author, class_name: 'Test', foreign_key: :author_id

  def completed_by_level(level)
    tests.level(level)
  end
end
