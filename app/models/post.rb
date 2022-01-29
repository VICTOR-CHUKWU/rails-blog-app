class Post < ApplicationRecord
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
    Comment.order(created_at: :desc).limit(5)
  end
end
