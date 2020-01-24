class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests

  def self.names_by_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
    .where('categories.title' => category)
    .order('tests.title DESC')
    .pluck('tests.title')
  end

end


