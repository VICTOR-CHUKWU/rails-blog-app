class CommentsController < ApplicationController
  # before_action :current_user

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], user_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@post.user.id, @post.id) if @comment.save
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
