class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @user = User.includes(:posts).find(params[:id])
    @user = current_user
  end
end
