class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def select_first_user
    posts.order(created_at: :desc).limit(3)
  end
end
