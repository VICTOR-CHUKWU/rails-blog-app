class User < ApplicationRecord
  validates :name, presence: true
  validates :post_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts

  def select_first_user
    User.limit(3).order(created_at: :desc)
  end
end
