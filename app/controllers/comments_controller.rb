class CommentsController < ApplicationController
  before_action :current_user

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @comment = @post.comments.new(user_id: current_user.id, text: comment_params[:text], post_id: @post.id)
    if @comment.save
      flash[:notice] = 'Comment added succesfully'
    else
      flash[:alert] = 'Add Comment failed'
    end
    redirect_to user_post_path(@user.id, @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

def new
  @comment = Comment.new
  @id = params[:post_id]
end

def create
  id = params.require(:comment).permit(:post_id)
  post = Post.find(id[:post_id])
  comment = Comment.new(params.require(:comment).permit(:text))
  post.comments.push(comment)
  @user = current_user
  @user.comments.push(comment)
  if comment.save
    flash[:success] = 'Saved the comment succesfully'
    redirect_to action: 'show', controller: 'users', id: @user.id
  else
    flash.now[:fail] = 'Failed to Create New Comment'
    render :new, locals: { post: comment }
  end
end
