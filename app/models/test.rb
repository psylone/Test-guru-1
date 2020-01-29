class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests

  validates :author, :category, :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :middle, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }

  def self.names_by_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: {title: category})
    .order(title: :desc)
    .pluck(:title)
  end

end


