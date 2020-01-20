class User < ApplicationRecord
  def completed_by_level
    Test.joins('JOIN completed_tests ON tests.id = completed_tests.test_id')
    .where('completed_tests.user_id' => id, 'tests.level' => level)
end
