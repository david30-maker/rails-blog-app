class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      @posts = @user.recent_posts
      render :show
    else
      redirect_to users_url
    end
  end
end
