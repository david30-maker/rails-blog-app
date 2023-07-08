class HomeController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource


  def index
    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new
      render 'new'
    end
  end
end
