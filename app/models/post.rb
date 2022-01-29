class Post < ApplicationRecord
  validates :title, length: { maximum: 250 }, presence: true
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comment_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def increase_post_count
    user.increment!(:post_counter)
  end

  def like(user)
    likes << Like.new(user_id: user)
  end

  def find_five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
