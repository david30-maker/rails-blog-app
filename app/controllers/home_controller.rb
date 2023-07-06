class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new
      render 'new'
    end
  end
end
