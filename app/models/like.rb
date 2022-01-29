class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def increase_likes_counter
    post.increment!(:likes_count)
  end
end
