class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(params.require(:post).permit(:title, :text))
    # @post = Post.new(params.require(:post).permit(:title, :text))
    # @user.posts.push(@post)
    if @post.save
      flash[:success] = 'Created New Post succesfully'
      redirect_to action: 'show', controller: 'user', id: @user.id
    else
      flash.now[:fail] = 'Failed to Create New Post'
      render :new, locals: { post: @post }
    end
  end
end
