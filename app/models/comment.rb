class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  def increase_comments_counter
    posts.increment!(:comment_count)
  end
end
