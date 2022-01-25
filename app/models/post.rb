class Post < ApplicationRecord
  belongs_to :users
  has_many :likes
  has_many :comments

  def increase_post_count
    users.increment!(:post_counter)
  end

  def find_five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
