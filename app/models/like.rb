class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  def increase_likes_counter
    posts.increment!(:likes_count)
  end
end
