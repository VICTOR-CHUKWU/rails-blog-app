require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'tests that Like model is created correctly' do
    like = Like.new
    like.build_user(name: 'Riley')
    like.build_post(text: '')
    expect(like).to be_valid
  end

  it 'updates a posts likes correctly' do
    user = User.new(name: 'Carrie', post_count: 0)
    # user.skip_confirmation!
    user2 = User.create!(name: 'Henry', post_count: 0)
    post = user2.posts.create!(title: 'Post1', text: 'This is a post', likes_count: 0, comment_count: 0)
    post.likes.create!(user: user)
  end
end
