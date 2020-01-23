class User < ApplicationRecord
  has_many :test through completed_tests
  has_many :completed_tests
  def completed_by_level(level)
    Test.joins('JOIN completed_tests ON tests.id = completed_tests.test_id')
    .where('completed_tests.user_id' => id, 'tests.level' => level)
end
