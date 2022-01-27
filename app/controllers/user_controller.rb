class UserController < ApplicationController
  def index
    @users = User.first(5)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.select_first_user
  end
end
