require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'add some examples to (or delete)' do
    author = User.new(name: 'Mandy', photo: '', bio: '',
                      post_count: 0)

    post = Post.new(title: 'Frustrating...', text: 'I haven\'t completed things...',
                    user: author, likes_count: 0, comment_count: 0)
    post.save!

    comment_creator = User.new(name: 'Mike', photo: '', bio: '',
                               post_count: 0)

    post.comments.create!(text: 'nice one', user: comment_creator)
    post.comments.create!(text: 'really nice post', user: comment_creator)
    expect(post.comments.length).to eql(2)
  end
end
