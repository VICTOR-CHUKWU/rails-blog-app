class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def increase_comments_counter
    post.increment!(:comment_count)
  end
end
