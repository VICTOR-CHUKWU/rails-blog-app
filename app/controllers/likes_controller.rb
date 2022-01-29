class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    post = Post.find(params[:format])
    like = post.likes.new(user_id: current_user.id)

    flash.now[:success] = 'Add likes unsuccesful' unless like.save
    redirect_to user_path(post.user.id)
  end
end
