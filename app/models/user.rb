class User < ApplicationRecord
  has_many :tests, through: :completed_tests
  has_many :completed_tests
  has_many :tests, class_name: 'Test', foreign_key: :author_id
  def completed_by_level(level)
    Test.joins('JOIN completed_tests ON tests.id = completed_tests.test_id')
    .where('completed_tests.user_id' => id, 'tests.level' => level)
  end
end
